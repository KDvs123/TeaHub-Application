import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:TeaHub/disease_description_treatment/product_screen2.dart';

class DiseaseInfoScreen extends StatefulWidget {
  @override
  _DiseaseInfoScreenState createState() => _DiseaseInfoScreenState();
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  double _dragExtent = 0.0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight / 2;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/teabot.png',
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.25), // Adjust the space for the AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Grey Blight',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pestalotiopsis',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: containerHeight,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                          onPressed: () {
                            // TODO: Play audio
                          },
                          icon: Icon(Icons.play_circle_fill, size: 30),
                          label: Text(
                            textAlign:TextAlign.left,
                            'Listen to the symptoms\nUse the play button to listen to the content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        Text(
                          '• Small, oval, pale yellow-green spots first appear on young leaves.\n'
                              '• Often the spots are surrounded by a narrow, yellow zone.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 24), // Additional spacing before the slider
                        Center(
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              setState(() {
                                _dragExtent += details.primaryDelta ?? 0;
                                _dragExtent = _dragExtent.clamp(0.0, MediaQuery.of(context).size.width - 240.0);
                              });
                            },
                            onHorizontalDragEnd: (details) {
                              if (_dragExtent >= MediaQuery.of(context).size.width - 240.0) {
                                // TODO: Navigate to the treatment plan screen
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DiseaseInfoScreen()));
                              }
                              setState(() {
                                _dragExtent = 0.0;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF4ECB81).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "View the Treatment Plan",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  Positioned(
                                    left: _dragExtent,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

