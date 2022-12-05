import 'package:flutter/material.dart';
import '../models/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email.subject),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${email.from}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 170, 255),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 10.0),
              const SizedBox(height: 10.0),
              Text(email.subject,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 5.0),
              Text(email.dateTime.toString().substring(0, 16),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 163, 163, 163),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 10.0),
              const Divider(color: Color(0xff000000)),
              const SizedBox(height: 10.0),
              Text(email.body,
                  style: const TextStyle(
                    fontSize: 15.0,
                  )),
            ],
          ),
        ));
  }
}
