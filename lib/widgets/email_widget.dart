import 'package:flutter/material.dart';
import '../models/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: email.read
                        ? Color.fromARGB(0, 255, 255, 255)
                        : const Color(0xff3e2723),
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(email.from,
                      style: TextStyle(
                        color: email.read
                            ? Color.fromARGB(255, 182, 182, 182)
                            : Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15.0,
                        fontWeight:
                            email.read ? FontWeight.w400 : FontWeight.w700,
                      )),
                  Text(email.subject,
                      style: TextStyle(
                        color: email.read
                            ? Color.fromARGB(255, 0, 0, 0)
                            : Color.fromARGB(255, 0, 170, 255),
                        fontSize: 15.0,
                        fontWeight:
                            email.read ? FontWeight.w400 : FontWeight.w700,
                      )),
                  Text(email.dateTime.toString().substring(0, 10),
                      style: TextStyle(
                        color: Color.fromARGB(255, 182, 182, 182),
                        fontSize: 14.0,
                        fontWeight:
                            email.read ? FontWeight.w500 : FontWeight.w700,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
