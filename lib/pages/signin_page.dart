import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 78, 203, 128),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In Page',
                style: TextStyle(
                  fontSize: 45,
                  color: Color.fromARGB(255, 78, 203, 128),
                  //color: Color.fromARGB(255, 0, 204, 51),
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
