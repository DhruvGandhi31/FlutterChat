import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // static const routeName = '/chat';

  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    // final token = await fcm.getToken();

    // print(token);

    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();

    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Text(
                'FlutterChat',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.all(8),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Icon(Icons.logout)),
            ),
          ],
        ),
        Expanded(child: ChatMessages()),
        NewMessages()
      ],
    ));
  }
}
