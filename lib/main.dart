// import 'package:bubble/bubble.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
// const MyHomePage({Key? key, required this.title}) : super(key: key);

// // This class is the configuration for the state. It holds the values (in this
// // case the title) provided by the parent (in this case the App widget) and
// // used by the build method of the State. Fields in a Widget subclass are
// // always marked "final".

// final String title;

// @override
// _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // dialog flow code was here.


//   @override
//   Widget build(BuildContext context) {
//     var messages;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Chat bot",
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.only(top: 15, bottom: 10),
//               child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", style: const TextStyle(
//                 fontSize: 20
//               ),),
//             ),
//             Flexible(
//                 child: ListView.builder(
//                     reverse: true,
//                     itemCount: messages.length,
//                     itemBuilder: (context, index) => chat(
//                         messages[index]["message"].toString(),
//                         messages[index]["data"]))),
//             const SizedBox(
//               height: 20,
//             ),

//             const Divider(
//               height: 5.0,
//               color: Colors.greenAccent,
//             ),
//             Container(


//               child: ListTile(

//                   leading: IconButton(
//                     icon: const Icon(Icons.camera_alt, color: Colors.greenAccent, size: 35,), onPressed: () { },
//                   ),

//                   title: Container(
//                     height: 35,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(
//                           15)),
//                       color: Color.fromRGBO(220, 220, 220, 1),
//                     ),
//                     padding: const EdgeInsets.only(left: 15),
//                     child: TextFormField(
//                       controller: messageInsert,
//                       decoration: const InputDecoration(
//                         hintText: "Enter a Message...",
//                         hintStyle: TextStyle(
//                             color: Colors.black26
//                         ),
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                       ),

//                       style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.black
//                       ),
//                       onChanged: (value) {

//                       },
//                     ),
//                   ),

//                   trailing: IconButton(

//                       icon: const Icon(

//                         Icons.send,
//                         size: 30.0,
//                         color: Colors.greenAccent,
//                       ),
//                       onPressed: () {

//                         if (messageInsert.text.isEmpty) {
//                           print("empty message");
//                         } else {
//                           setState(() {
//                             messsages!.insert(0,
//                                 {"data": 1, "message": messageInsert.text});
//                           });
//                           response(messageInsert.text);
//                           messageInsert.clear();
//                         }
//                         FocusScopeNode currentFocus = FocusScope.of(context);
//                         if (!currentFocus.hasPrimaryFocus) {
//                           currentFocus.unfocus();
//                         }
//                       }),

//               ),

//             ),

//             const SizedBox(
//               height: 15.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   //for better one i have use the bubble package check out the pubspec.yaml

//   Widget chat(String message, int data) {
//     return Container(
//       padding: const EdgeInsets.only(left: 20, right: 20),

//       child: Row(
//           mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: [

//             data == 0 ? Container(
//               height: 60,
//               width: 60,
//               child: const CircleAvatar(
//                 backgroundImage: AssetImage("assets/robot.jpg"),
//               ),
//             ) : Container(),

//         Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Bubble(
//             radius: const Radius.circular(15.0),
//             color: data == 0 ? const Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
//             elevation: 0.0,

//             child: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[

//                   const SizedBox(
//                     width: 10.0,
//                   ),
//                   Flexible(
//                       child: Container(
//                         constraints: const BoxConstraints( maxWidth: 200),
//                         child: Text(
//                           message,
//                           style: const TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ))
//                 ],
//               ),
//             )),
//       ),


//             data == 1? Container(
//               height: 60,
//               width: 60,
//               child: const CircleAvatar(
//                 backgroundImage: AssetImage("assets/default.jpg"),
//               ),
//             ) : Container(),

//           ],
//         ),
//     );
//   }
// }
