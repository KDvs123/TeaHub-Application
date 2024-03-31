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
  bool showScrollToTopButton = false;
  List<String> teaQuestions = [];


  void sendMsg() async {
    String text = controller.text.trim();
    if (text.isEmpty) {
      return;
    }

    controller.clear();

    setState(() {
      msgs.add(Message(sender: true, text: text)); 

      isTyping = true;
    });


    if (!checkIfTeaRelated(text)) {
      setState(() {
        msgs.add(Message(sender: false, text: "I'm only specializing in tea. Please ask something related to tea."));
      });
      return;
    }

    String apiKey = "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"; // Replace with your actual API key
    
    

    // Clear input field and animate scroll

    
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
  void initState() {
    super.initState();
    loadTeaQuestions();
    scrollController.addListener(() {
      const scrollThreshold = 50; // Change this value as needed
      if (scrollController.offset >= scrollThreshold && !showScrollToTopButton) {
        setState(() => showScrollToTopButton = true);
      } else if (scrollController.offset < scrollThreshold && showScrollToTopButton) {
        setState(() => showScrollToTopButton = false);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void loadTeaQuestions() async {
    final rawData = await rootBundle.loadString('assets/Teahub.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(rawData);
    setState(() {
      teaQuestions = csvTable.map((row) => row[0].toString().toLowerCase().trim()).toList();
    });
  }

  bool checkIfTeaRelated(String text) {
    // Normalize text for comparison
    String normalizedText = text.toLowerCase().trim();

    // Keywords related to tea cultivation, diseases, and treatment plans
    List<String> teaKeywords = [
      'tea',
      'blister blight',
      'cultivation',
      'fertilization',
      'pruning',
      'harvesting',
      'withering',
      'oxidation',
      'fermentation',
      'drying',
      'steaming',
      'rolling',
      'pests',
      'fungal',
      'disease',
      'treatment',
      // Add more relevant keywords as needed
    ];

    // Add normalized questions from CSV to the keywords list for a comprehensive check
    List<String> allTeaRelatedWords = List.from(teaKeywords)
      ..addAll(teaQuestions.map((q) => q.toLowerCase().trim()).toList());

    // Check if normalized text contains any of the tea-related words or vice versa
    return allTeaRelatedWords.any((word) =>
    normalizedText.contains(word) || word.contains(normalizedText));
  }





 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 200), // Adjust for text field space
                  controller: scrollController,
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return buildHeader();
                    } else {
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
          if (showScrollToTopButton) // Conditionally display the 3D effect FAB
            Positioned(
              bottom: 170, // Adjusted to move the button a bit higher
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    scrollController.animateTo(
                      0.0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green[700]!, Colors.green[400]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.4),
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                ),
              ),
            ),
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
    bool isSpecialMessage = message.text == "I'm only specializing in tea. Please ask something related to tea.";

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
            color: isSender ? Colors.blue : (isSpecialMessage ? Colors.red : Color(0xFF4ECB81)),
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



