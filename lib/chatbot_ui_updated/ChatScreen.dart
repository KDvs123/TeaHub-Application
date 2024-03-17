import 'dart:convert';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './message.dart'; // Make sure this file exists and contains the Message class

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<Message?> msgs = [null];// Include a null at the start for the header
  bool isTyping = false;

  void sendMsg() async {
    String text = controller.text.trim();
    if (text.isEmpty) {
      return;
    }
    String apiKey = "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"; // Replace with your actual API key
    setState(() {
      msgs.add(Message(sender: true, text: text));
      isTyping = true;
    });
    controller.clear();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 100.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    try {
      var response = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo", // Replace with the model you are using
          "messages": [{"role": "user", "content": text}],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var reply = data["choices"][0]["message"]["content"].toString().trimLeft();
        setState(() {
          isTyping = false;
          msgs.add(Message(sender: false, text: reply));
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Some error occurred, please try again!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 160),
              controller: scrollController,
              itemCount: msgs.length,
              itemBuilder: (context, index) {
                if (index == 0) { // Check for header
                  return buildHeader();
                } else {
                  // Adjust for null header in index 0
                  Message message = msgs[index]!;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: buildMessage(message, message.sender),
                  );
                }
              },
            ),
          ),
          buildInputField(),
        ],
      ),
    );
  }
  Widget buildHeader() {
    // Build your header widget here
    return Column(
      children: [
        SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/teabot.png', width: 150),
              SizedBox(width: 25),
              Text(
                "Hello!\nI'm TeaBot",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildMessage(Message message, bool isSender) {
    // Build your message widget here
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isSender) ...[
          Icon(Icons.chat, color: Color(0xFF4ECB81)),
          SizedBox(width: 8),
        ],
        Expanded(
          child: BubbleNormal(
            text: message.text,
            isSender: isSender,
            color: isSender ? Colors.blue : Color(0xFF4ECB81),
            tail: true,
            textStyle: TextStyle(
              fontSize: 16,
              color: isSender ? Colors.white : Colors.black87,
            ),
          ),
        ),
        if (isSender) ...[
          SizedBox(width: 8),
          Icon(Icons.account_circle, color: Colors.blue),
        ],
      ],
    );
  }

  Widget buildInputField() {
    // Build your input field widget here
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: const Color.fromRGBO(78, 203, 113, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Enter text",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => sendMsg(),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: sendMsg,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



