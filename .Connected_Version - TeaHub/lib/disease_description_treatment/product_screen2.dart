// import 'package:description_page/colors.dart';
import 'package:TeaHub/disease_description_treatment/colors.dart';
import 'package:flutter/material.dart';

class ProductScreen2 extends StatelessWidget {
  const ProductScreen2({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Details",
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
              child: Text(
                "xwiefhw xfwx ywyfgwyef wyfwygefgweuf wefgwyefgw uyguywfw wefgwuef wefgwuef efuwguefy efwegf wuwfweuf wrfgwu fwuerw wfygwuerg w uweyrgwuegurw wergwufywu efw wygfweihfiw wiefiwjeniwrfhwi fihfirhfidncjsd ",
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
