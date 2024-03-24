import 'package:flutter/material.dart';
import 'package:TeaHub/disease_description_treatment/colors.dart';

class ProductScreen extends StatelessWidget {
  final String selectedDisease;
  ProductScreen({required this.selectedDisease});

  String getDescription(String disease) {
    switch (disease) {
      case 'Algal Leaf Spot':
        return 'Algal leaf spot is the disease.';
      case 'Brown Blight':
        return 'Brown Blight is the disease.';
      case 'Gray Blight':
        return 'Gray Blight is the disease.';
      case 'Healthy':
        return 'Healthy is the disease.';
      case 'Helopeltis':
        return 'Helopeltis is the disease.';
      case 'Red Leaf Spot':
        return 'Red Leaf Spot is the disease.';
      default:
        return 'Description not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = getDescription(
        selectedDisease); // Implement this function to get description based on the selected disease
    return Scaffold(
      backgroundColor: colors.whiteClr,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/disease_description_and_treatment_imgs/welcome.jpg",
              height: MediaQuery.of(context).size.height / 2,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Plant Name",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(description)),
          ],
        ),
      ),
    );
  }
}
