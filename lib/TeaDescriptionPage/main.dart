import 'package:api/teaDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Example'),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<List<Tea>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Filter out teas without an image attribute
              final teasWithImage = snapshot.data!.where((tea) => tea.imageUrl.isNotEmpty).toList();
              return GridView.builder(
                itemCount: teasWithImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  mainAxisSpacing: 10.0, // spacing between rows
                  crossAxisSpacing: 10.0, // spacing between columns
                  childAspectRatio: 160 / 242, // aspect ratio of each item
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Frame1Widget(tea: teasWithImage[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Tea>> fetchData() async {
    final response = await http.get(Uri.parse('https://boonakitea.cyclic.app/api/all'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      List<Tea> teas = jsonData.map((e) => Tea.fromJson(e)).toList();
      return teas;
    } else {
      throw Exception('Failed to load data');
    }
  }
}


class Tea {
  final String name;
  final String imageUrl;

  Tea({required this.name, required this.imageUrl});

  factory Tea.fromJson(Map<String, dynamic> json) {
    return Tea(
      name: json['name'] ?? '', // Provide default value if name is null
      imageUrl: json['image'] ?? '', // Provide default value if imageUrl is null
    );
  }
}

class Frame1Widget extends StatelessWidget {
  final Tea tea;

  Frame1Widget({required this.tea});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to TeaDetailsPage and pass the tea object
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeaDetailsPage(), settings: RouteSettings(arguments: tea)),
        );
      },
      child: Container(
        width: 140,
        height: 220,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 20),
              blurRadius: 52,
            ),
          ],
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 250,
              left: 25,
              child: Text(
                tea.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(48, 64, 34, 1),
                  fontFamily: 'Lexend',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 241,
              left: 125,
              child: Container(
                width: 28,
                height: 27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(0, 8),
                      blurRadius: 17,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment(-2.9608793639113173e-8, 0.6136363744735718),
                    end: Alignment(-0.6136363744735718, -2.753164629609728e-8),
                    colors: [
                      Color.fromRGBO(213, 235, 203, 1),
                      Color.fromRGBO(156, 237, 107, 1),
                      Color.fromRGBO(87, 145, 51, 1)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -3,
              left: 0,
              right: 0, // Make the image take the same width as the grid cell
              child: Container(
                height: 200, // Half of the grid cell height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(tea.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 242,
              left: 128,
              bottom: 120,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeaDetailsPage(), settings: RouteSettings(arguments: tea)),
                  );
                },
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
