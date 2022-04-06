import 'package:flutter/material.dart';
import 'package:chat_app/models/chatUsersModel.dart';
import 'package:chat_app/models/chatMessageModel.dart';

class ChatDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userDetail = ModalRoute.of(context).settings.arguments as ChatUsers;
    List messages = [
      ChatMessage("Hello, Will", "receiver"),
      ChatMessage("How have you been?", "receiver"),
      ChatMessage("Hey Kriss, I am doing fine dude. wbu?", "sender"),
      ChatMessage("ehhhh, doing OK.", "receiver"),
      ChatMessage("Is there any thing wrong?", "sender"),
      ChatMessage("Hello, Will", "receiver"),
      ChatMessage("How have you been?", "receiver"),
      ChatMessage("Hey Kriss, I am doing fine dude. wbu?", "sender"),
      ChatMessage("ehhhh, doing OK.", "receiver"),
      ChatMessage("Is there any thing wrong?", "sender"),
      ChatMessage("Hello, Will", "receiver"),
      ChatMessage("How have you been?", "receiver"),
      ChatMessage("Hey Kriss, I am doing fine dude. wbu?", "sender"),
      ChatMessage("ehhhh, doing OK.", "receiver"),
      ChatMessage("Is there any thing wrong?", "sender"),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 8),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(userDetail.imageUrl),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userDetail.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.settings), onPressed: () {})
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 55),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: messages[index].messageType == 'receiver'
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: messages[index].messageType == 'receiver'
                            ? Colors.grey.shade200
                            : Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        messages[index].message,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                );
              },
              itemCount: messages.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write message..",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        elevation: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
