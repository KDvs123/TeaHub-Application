import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class priceWidget extends StatefulWidget {
  @override
  _priceWidgetState createState() => _priceWidgetState();
}

class _priceWidgetState extends State<priceWidget> {
  late Future<Map<String, dynamic>> _albumFuture;

  Future<Map<String, dynamic>> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/09da860c-0e99-412e-bb12-a96aa37ad21c'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);

      return data;
    } else {
      String jsonData =
          await rootBundle.loadString('assets/TeaPrice_data.json');
      Map<String, dynamic> data = json.decode(jsonData);

      // Throw an exception indicating failure to load album
      return data;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAlbum();
  }

  void _fetchAlbum() {
    _albumFuture = fetchAlbum();
    _albumFuture.then((response) {
      print('Response body: ${response}');
    }).catchError((error) {
      print('Error fetching album: $error');
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Map<String, dynamic>>(
        future: _albumFuture,
        builder: (context, snapshot) {
          double? thisMonth;
          double? lastMonth;

          if (snapshot.data != null) {
            thisMonth = double.tryParse(snapshot.data!["Last Value"] ?? '');

            lastMonth =
                double.tryParse(snapshot.data!["Value from Last Month"] ?? '');
          }

          IconData iconData = Icons.error; // Default icon for error
          Color iconColor = Colors.grey; // Default color for error

          if (thisMonth != null && lastMonth != null) {
            if (thisMonth > lastMonth) {
              iconData = Icons.trending_up;
              iconColor = const Color.fromARGB(255, 81, 255, 0);
            } else if (thisMonth < lastMonth) {
              iconData = Icons.trending_down;
              iconColor = Colors.red;
            } else {
              // If values are equal
              iconData = Icons.horizontal_rule;
              iconColor = Colors.blue;
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError) {
            // return CircularProgressIndicator();
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 78, 203, 128),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth:
                          4, // You can adjust the stroke width as needed
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white), // Color of the progress indicator
                      backgroundColor: Colors
                          .transparent, // Background color of the progress indicator
                      value: null, // Set value to null to make it indeterminate
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFFDDB892).withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tea Price',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${snapshot.data!["Last Value"]} (USD/Kgs)',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30), // Adjust as needed
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              iconData,
                              color: iconColor,
                              size: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Growth Rate\t\t\t\t\t\t\t\t\t:  ${snapshot.data!["Average Growth Rate"]}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Value from Last Month\t\t\t\t\t\t:  ${snapshot.data!["Value from Last Month"]}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Change Rate Last Month\t\t\t:  ${snapshot.data!["Change from Last Month"]}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
