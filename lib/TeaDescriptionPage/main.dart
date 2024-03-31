import 'package:chatbotui/TeaDescriptionPage/teaDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController searchController = TextEditingController();
  late List<Tea> allTeas; // List to hold all teas.
  late List<Tea> filteredTeas; // List to hold teas after a search is performed.

  @override
  void initState() {
    super.initState();
    allTeas = []; // Initialize to an empty list.
    filteredTeas = []; // Initialize to an empty list.
    fetchData(); // Fetch your tea data from the API.
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

   @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<Tea>> fetchData() async {
    final String response = await rootBundle.loadString('images/tea.json');
    final List jsonData = json.decode(response) as List;
    List<Tea> teas = jsonData.map((json) => Tea.fromJson(json)).toList();
    return teas;
  }

  void filterSearchResults(String query) {
    List<Tea> dummySearchList = [];
    if (query.isNotEmpty) {
      dummySearchList.addAll(allTeas);
      dummySearchList = dummySearchList.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      dummySearchList = List.from(allTeas);
    }
    setState(() {
      filteredTeas = dummySearchList;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top:35.0,left: 20.0,right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/teaPage/hamburger_menu.png'),
                      onPressed: () {
                        // Handle menu button press
                      },
                    ),
                    Spacer(), // This will create space between the elements
                    IconButton(
                      icon: Image.asset('assets/teaPage/notification_icon.png'),
                      onPressed: () {
                        // Handle notifications button press
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0,top:8.0), // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      "Let's find your",
                      style: TextStyle(
                        color: Color(0xFF4ecb81), // The specified green color
                        fontWeight: FontWeight.w900,
                        fontSize: 36, // Increased font size
                      ),
                    ),
                    Text(
                      "plants",
                      style: TextStyle(
                        color: Color(0xFF4ecb81), // The specified green color
                        fontWeight: FontWeight.w900,
                        fontSize: 36, // Same font size for uniformity
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24), // Spacing between title and search bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.greenAccent.shade100,
                  ),
                  onChanged: (value) {
                  filterSearchResults(value);
                },
                ),
              ),
              SizedBox(height:16),
              Expanded(
                child: searchController.text.isNotEmpty
                ? GridView.builder(
              itemCount: filteredTeas.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 160 / 242,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Frame1Widget(tea: filteredTeas[index]);
              },
            )
            : FutureBuilder<List<Tea>>(
                  future: fetchData(), // Replace with your data fetching logic
                  builder: (BuildContext context, AsyncSnapshot<List<Tea>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      allTeas = snapshot.data!;
                      filteredTeas = allTeas;
                      return GridView.builder(
                        itemCount: filteredTeas.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 160 / 242,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Frame1Widget(tea: filteredTeas[index]);
                        },
                      );
                    }else {
                    return Center(child: Text("No data found"));
                      }
                  },
                ),
              ),
            ],
          
        ),
      ),
    );
  }


  
}


class Tea {
  final String name;
  final String imageUrl;
  final String alternativeName;
  final String origin;
  final String type;
  final String caffeine;
  final String caffeineLevel;
  final String mainIngredients;
  final String description;
  final String colourDescription;

  Tea({
    required this.name,
    required this.imageUrl,
    required this.alternativeName,
    required this.origin,
    required this.type,
    required this.caffeine,
    required this.caffeineLevel,
    required this.mainIngredients,
    required this.description,
    required this.colourDescription
    });

  factory Tea.fromJson(Map<String, dynamic> json) {
    // A helper function to get value or return a default
    String getOrDefault(String key, String defaultValue) {
      var value = json[key];
      return (value == null || value.isEmpty) ? defaultValue : value;
    }

    return Tea(
      name: getOrDefault('name', 'None'),
      imageUrl: getOrDefault('image', '.noimage.webp'),
      alternativeName: getOrDefault('altnames', 'None'),
      origin: getOrDefault('origin', 'None'),
      type: getOrDefault('type', 'None'),
      caffeine: getOrDefault('caffeine', 'None'),
      caffeineLevel: getOrDefault('caffeineLevel', 'None'),
      description: getOrDefault('description', 'None'),
      colourDescription: getOrDefault('colorDescription', 'None'),
      mainIngredients: getOrDefault('tasteDescription', 'None'),
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
