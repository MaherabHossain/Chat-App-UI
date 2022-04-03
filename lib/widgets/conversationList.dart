import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  String name;
  String messageTxt;
  String imageUrl;
  String time;
  bool isMessageRead;

  ConversationList(name, messageTxt, imageUrl, time, isMessageRead) {
    this.name = name;
    this.messageTxt = messageTxt;
    this.imageUrl = imageUrl;
    this.time = time;
    this.isMessageRead = isMessageRead;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Text(imageUrl),
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(messageTxt),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(time,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isMessageRead ? FontWeight.bold : FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
