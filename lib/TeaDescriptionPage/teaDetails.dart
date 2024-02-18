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
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Details'),
      ),
      body: Center(
        child: TeaDetailsWidget(),
      ),
    );
  }
}

class TeaDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Green Tea',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Alternative Name:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Sencha',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Origin:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'China',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Type:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Green Tea',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Container(
          height: MediaQuery.of(context).size.height * 0.5, // Half the height of the screen
          width: MediaQuery.of(context).size.width * 0.4,
          child: Stack(
            children: [
              Positioned.fill(

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.25),
                      bottomLeft: Radius.circular(MediaQuery.of(context).size.height * 0.25),
                    ),
                    color: Colors.green, // You can change the color or use an image here
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



