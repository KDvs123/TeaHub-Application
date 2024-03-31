import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  Future<Map<String, TextEditingController>> onLoad() async {
    final prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('uid');

    final currentUser = await FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isEqualTo: uid)
        .get();

    Map<String, TextEditingController> controllers = {
      'fullName': TextEditingController(),
      'nickName': TextEditingController(),
      'email': TextEditingController(),
      'phoneNumber': TextEditingController(),
      'country': TextEditingController(),
      'gender': TextEditingController(),
      'address': TextEditingController(),
    };

    currentUser.docs.forEach((doc) {
      if (doc.data() != null) {
        controllers['fullName'] =
            TextEditingController(text: doc.data()['fullName'] ?? '');
        controllers['nickName'] =
            TextEditingController(text: doc.data()['nickName'] ?? '');
        controllers['email'] =
            TextEditingController(text: doc.data()['email'] ?? '');
        controllers['phoneNumber'] =
            TextEditingController(text: doc.data()['phonenumber'] ?? '');
        controllers['country'] =
            TextEditingController(text: doc.data()['country'] ?? '');
        controllers['gender'] =
            TextEditingController(text: doc.data()['gender'] ?? '');
        controllers['address'] =
            TextEditingController(text: doc.data()['address'] ?? '');
      }
    });

    return controllers;
  }

  Future<void> updateUser(
      Map<String, TextEditingController> controllers) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var uid = prefs.getString('uid');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(doc.id)
            .update({
          'fullName': controllers['fullName']!.text,
          'nickName': controllers['nickName']!.text,
          'email': controllers['email']!.text,
          'phonenumber': controllers['phoneNumber']!.text,
          'country': controllers['country']!.text,
          'gender': controllers['gender']!.text,
          'address': controllers['address']!.text,
        });
      }
      print('Users updated successfully');
    } catch (e) {
      print('Failed to update user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, TextEditingController>>(
      future: onLoad(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        } else {
          Map<String, TextEditingController> controllers = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              titleSpacing: NavigationToolbar.kMiddleSpacing,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    MyTextField(
                      controller: controllers['fullName']!,
                      obscureText: false,
                      labelText: 'Full Name',
                      filled: true,
                    ),
                    SizedBox(height: 15),
                    MyTextField(
                      controller: controllers['nickName']!,
                      obscureText: false,
                      labelText: 'Nick Name',
                      filled: true,
                    ),
                    SizedBox(height: 15),
                    MyTextField(
                      controller: controllers['email']!,
                      obscureText: false,
                      labelText: 'Email',
                      filled: true,
                    ),
                    SizedBox(height: 15),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 25.0, vertical: 10.0),
                    //   child: TextField(
                    //     controller: controllers['phoneNumber']!,
                    //     obscureText: false,
                    //     decoration: InputDecoration(
                    //       labelText: 'Phone Number',
                    //       filled: true,
                    //       fillColor: Colors.greenAccent.shade100,
                    //       border: OutlineInputBorder(),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      child: TextField(
                        controller: controllers['phoneNumber']!,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              width: 25.0,
                              height: 20.0,
                              child:
                                  Image.asset('assets/editpage/srilanka.png'),
                            ),
                          ),
                          labelText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.greenAccent.shade100,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: TextField(
                                controller: controllers['country']!,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Country',
                                  filled: true,
                                  fillColor: Colors.greenAccent.shade100,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: TextField(
                                controller: controllers['gender']!,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Gender',
                                  filled: true,
                                  fillColor: Colors.greenAccent.shade100,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    MyTextField(
                      controller: controllers['address']!,
                      obscureText: false,
                      labelText: 'Address',
                      filled: true,
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () async {
                        await updateUser(controllers);
                        SendEmailMessage(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 78, 203, 128),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

void SendEmailMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: Container(
          width: 300, // Adjust width as needed
          height: 200, // Adjust height as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_sharp, // Replace with the appropriate icon
                color: Color.fromARGB(255, 78, 203, 128),
                size: 80,
              ),
              SizedBox(height: 10),
              Text(
                'Success',
                textAlign: TextAlign.center, // Align text to the center
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Adjust the height for spacing
              Text(
                'Profile updated successfully.',
                textAlign: TextAlign.center, // Align text to the center
                style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Container(
              width: 200, // Adjust width as needed
              height: 40, // Adjust height as needed

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    5), // Adjust border radius for roundness
                color: Colors.blue, // Set button background color
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final bool filled;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    this.labelText,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          filled: filled,
          fillColor: Colors.greenAccent.shade100,
        ),
      ),
    );
  }
}
