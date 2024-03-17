import 'package:flutter/material.dart';

class SnapTips extends StatelessWidget {
  const SnapTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment:
            Alignment.bottomCenter, // Align the column to the bottom center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title "Snap Tips"
            Text(
              "Snap Tips",
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                //color: Colors.black, // Font color black
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 20), // Spacer between title and first larger image
            // First larger image in the center
            Stack(
              children: [
                Container(
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.green, // Green border
                      width: 4,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "lib/images/snap_tips imgs/image 1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8, // Adjust the top padding as needed
                  right: 8, // Adjust the right padding as needed
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30, // Adjust the icon size as needed
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Spacer between the first and second row

            // Second row with three smaller images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageWithBorderAndIcon(
                    "lib/images/snap_tips imgs/image 2.jpg",
                    Colors.red,
                    "Too close"),
                SizedBox(width: 30), // Increase the spacer between images
                _buildImageWithBorderAndIcon(
                    "lib/images/snap_tips imgs/image 3.jpg",
                    Colors.red,
                    "Too far"),
                SizedBox(width: 30), // Increase the spacer between images
                _buildImageWithBorderAndIcon(
                    "lib/images/snap_tips imgs/image 4.jpg",
                    Colors.red,
                    "Multiple species"),
              ],
            ),
            SizedBox(height: 40), // Spacer between images and button
            Container(
              width: double.infinity, // Make the button full width
              margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20), // Add margin horizontally and vertically
              child: Material(
                elevation: 5, // Add elevation for shadow effect
                borderRadius:
                    BorderRadius.circular(30), // Make the button circular
                color: Colors.green, // Set button background color
                child: TextButton(
                  onPressed: () {
                    //Close snap tips page when click continue
                    Navigator.pop(context);
                    // Handle button press
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white, // Set button text color
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithBorderAndIcon(
      String imagePath, Color borderColor, String text) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: borderColor, // Red border
                  width: 4,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: -4, // Adjust the top padding as needed
              right: -4, // Adjust the right padding as needed
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(
                    4), // Add margin to avoid cutting off the circle
                decoration: BoxDecoration(
                  color: borderColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20, // Adjust the icon size as needed
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5), // Spacer between image and text
        Text(
          text,
          style: TextStyle(
            fontSize: 12, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Make the text bold
            //color: Colors.black, // Font color black
          ),
        ),
      ],
    );
  }
}
