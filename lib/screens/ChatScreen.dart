import 'package:chat_app/widgets/conversationList.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/chatUsersModel.dart';

class ChatScreen extends StatelessWidget {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        "Jane Russel",
        "Awesome Setup",
        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "Now"),
    ChatUsers(
        "Glady's Murphy",
        "That's Great",
        "https://image.shutterstock.com/image-photo/portrait-positive-cheerful-man-show-260nw-1531460657.jpg",
        "Yesterday"),
    ChatUsers(
        "Jorge Henry",
        "Hey where are you?",
        "https://media.istockphoto.com/photos/smiling-indian-man-looking-at-camera-picture-id1270067126?k=20&m=1270067126&s=612x612&w=0&h=ZMo10u07vCX6EWJbVp27c7jnnXM2z-VXLd-4maGePqc=",
        "31 Mar"),
    ChatUsers(
        "Philip Fox",
        "Busy! Call me in 20 mins",
        "https://thumbs.dreamstime.com/b/handsome-man-black-suit-white-shirt-posing-studio-attractive-guy-fashion-hairstyle-confident-man-short-beard-125019349.jpg",
        "28 Mar"),
    ChatUsers("Debra Hawkins", "Thankyou, It's awesome",
        "https://static.toiimg.com/photo/72957218.cms", "23 Mar"),
    ChatUsers(
        "Jacob Pena",
        "will update you in evening",
        "https://media.istockphoto.com/photos/mature-mixed-race-business-man-picture-id1059661424?k=20&m=1059661424&s=612x612&w=0&h=CLL4tto10GPo1gtMR9c-kPmf8VkvodjvTyqvtEuTLtg=",
        "17 Mar"),
    ChatUsers(
        "Andrey Jones",
        "Can you please share the file?",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShwIjMMGGKfEHrawR7b3xPPj1mCVe0UFwyjQ&usqp=CAU",
        "24 Feb"),
    ChatUsers(
        "John Wick",
        "How are you?",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuhEB5TN6Ku-wVjzZa_CiltogXAj4q_Cj30A&usqp=CAU",
        "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            // header
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Conversations",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pink.shade400,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('tapped d');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Add New',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // searchbox
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search..',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                  ),
                ),
              ),
              // conversation list
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    chatUsers[index].name,
                    chatUsers[index].messageTxt,
                    chatUsers[index].imageUrl,
                    chatUsers[index].time,
                    (index == 0 || index == 3) ? true : false,
                  );
                },
                itemCount: chatUsers.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
