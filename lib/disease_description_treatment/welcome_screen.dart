import 'package:TeaHub/disease_description_treatment/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:TeaHub/disease_description_treatment/colors.dart';

class WelcomeScreen extends StatelessWidget {
  final String disease;
  const WelcomeScreen({Key? key, required this.disease}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.whiteClr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            disease,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 1,
            ),
          ),
          Image.asset(
            "assets/images/disease_description_and_treatment_imgs/welcome.jpg",
            fit: BoxFit.cover,
            scale: 1.2,
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: colors.grnClr,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Text(
                "GO",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
