import 'package:flutter/material.dart';
import 'package:TeaHub/disease_description_treatment/colors.dart';

class ProductScreen extends StatelessWidget {
  final String selectedDisease;
  ProductScreen({required this.selectedDisease});

  String getDescription(String disease) {
    switch (disease) {
      case 'Algal Leaf Spot':
        return 'Algar leaf spot is a plant disease found in warm, humid areas or in places like greenhouses. It is caused by a green parasitic alga called Cephaleuros virescens. This alga usually lives on plants that have tough, leathery leaves. Tea plants are more likely to get infected when the soil does not drain properly, when the nutrients aren’t balanced, and they’re in hot and humid places.'; // Change the description text here
      case 'Brown Blight':
        return 'Brown blight is a widespread leaf disease found in all tea fields. It appears in weakened or injured bushes due to hard plucking, herbicide exposure, sun damage, waterlogging, and stem issues.';
      case 'Gray Blight':
        return 'Gray blight is caused by the Pestalotiopsis fungus and affects both young and old leaves. When new shoots are infected, they start dying.';
      case 'Helopeltis':
        return 'Helopeltis is a genus of insects in the family Miridae, commonly known as mosquito bugs. These insects are known for their economic significance as pests, particularly in agriculture. There are several species in the genus Helopeltis that can damage a variety of crops. Helopeltis Antoni, H. Brady, H. Sabora is the predominant species that attacks crops. Affected crops include cocoa, cashews, cotton, and tea.';
      case 'Red Leaf Spot':
        return 'Red leaf spot is a disease that occurs on creeping bentgrass when it’s warm and wet in spring, summer, or fall. It is caused by a type of disease called "Helminthosporium" which includes several diseases caused by fungi. These fungi create big, cigar-shaped spores.';
      default:
        return 'Description not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = getDescription(selectedDisease);
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
                    "Description",
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
                    selectedDisease, // Display the selected disease
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
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
