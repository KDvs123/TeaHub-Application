import 'package:chatbotui/TeaDescriptionPage/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TeaDetailsApp());
}

class TeaDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeaDetailsPage(),
    );
  }
}

class TeaDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extracting the tea object passed from main.dart
    final Tea tea = ModalRoute.of(context)!.settings.arguments as Tea;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: TeaDetailsWidget(tea: tea), // Pass the tea object to TeaDetailsWidget
        ),
    ),
    );
  }
}

class TeaDetailsWidget extends StatelessWidget {
  final Tea tea; 

  TeaDetailsWidget({required this.tea}); 
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child:Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 23,top:15), // Adding padding to the bottom of "Green Tea" text
                  child: Text(
                    tea.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4ECB81),
                    ),
                  ),
                ),
              SizedBox(height: 10),
               _buildInfoTag(context, 'Alternative Name:', tea.alternativeName),
                _buildInfoTag(context, 'Origin:', tea.origin),
                _buildInfoTag(context, 'Type:', tea.type),
                _buildInfoTag(context, 'Caffeine:', tea.caffeine),
                _buildInfoTag(context, 'Caffeine Level:', tea.caffeineLevel),
                _buildInfoTag(context, 'Main Ingredients:', tea.mainIngredients),
                _buildInfoTag(
                    context,
                    'Description:',
                    tea.description),
                _buildInfoTag(context, 'Color Description:', tea.colourDescription),
            ],
          ),
        ),
        ),
        SizedBox(width: 10),
        Container(
          height: MediaQuery.of(context).size.height * 0.5, // Half the height of the screen
          width: MediaQuery.of(context).size.width * 0.4,
          child: Stack(
            children: [
              Positioned.fill(
                top:50,
                right:0,
                bottom:0,
                left:20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.2,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.25),
                      bottomLeft: Radius.circular(MediaQuery.of(context).size.height * 0.25),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(tea.imageUrl),
                      fit: BoxFit.cover,
                    ), // You can change the color or use an image here
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTag(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title[0],
                  style: TextStyle(
                    fontSize: 20, // Set the font size of the first letter to 20
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: title.substring(1),
                  style: TextStyle(
                    fontSize: 18, // Set the font size of the rest of the label to 18
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),

          Text(
            content,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF4ECB81),
              fontWeight: FontWeight.bold,
              height: 1.5, // Line spacing
            ),
          ),
          SizedBox(height: 10),

        ],
      );
    }
  }
}



