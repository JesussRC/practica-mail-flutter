import 'package:flutter/material.dart';
import '../models/backend.dart';
import '../models/email.dart';
import '../widgets/email_widget.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // State.
  var emails = Backend().getEmails();

  void markEmailAsRead(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void showDetail(Email email) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(email: email);
    }));

    Backend().markEmailAsRead(email.id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      body: ListView.separated(
        itemCount: emails.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color.fromARGB(255, 85, 22, 125),
          indent: 40.0,
          endIndent: 20.0,
        ),
        itemBuilder: (BuildContext context, int index) => EmailWidget(
          email: emails[index],
          onTap: showDetail,
          onLongPress: markEmailAsRead,
          onSwipe: deleteEmail,
        ),
      ),
    );
  }
}
