import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'splash_screens/screen_1.dart';
import 'splash_screens/screen_2.dart';
import 'splash_screens/screen_3.dart';
import 'splash_screens/screen_4.dart';

class splashScreens extends StatefulWidget {
  const splashScreens({Key? key}) : super(key: key);

  @override
  _splashScreensState createState() => _splashScreensState();
}

class _splashScreensState extends State<splashScreens> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: SizedBox(
                child: PageView(
                  controller: _controller,
                  children: [
                    screen_1(),
                    screen_2(),
                    screen_3(),
                    //screen_4(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: MediaQuery.of(context).size.width / 3,
              child: Container(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color.fromARGB(255, 78, 203, 128),
                    dotColor: Colors.grey,
                  ),
                ),
              ),
            ),

            //Next button
            Positioned(
              bottom: 50,
              left: 33,
              child: TextButton(
                onPressed: () {
                  int pageIndex = _controller.page?.round() ??
                      0; // Round the double to get the nearest integer

                  if (pageIndex == 2) {
                    // Assuming screen_3() is at index 2 (0-based index)
                    //_controller.jumpToPage(3);  // Go back to the first page

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen_4()),
                    );
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 78, 203, 128),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Set the radius to 5
                    ),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
}
