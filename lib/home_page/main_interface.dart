import 'package:flutter/material.dart';
import 'utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(appBar: AppBar(
      title: Text('Main Page'),
    ),
    body: Container(
      width: double.infinity,
      child: Container(
        // maininterfaceQL4 (12:51)
        width: double.infinity,
        height: 792*fem,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // navDB2 (12:52)
              left: 19*fem,
              top: 7*fem,
              child: Container(
                width: 342*fem,
                height: 21*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // pmfYp (I12:52;1:11)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 222*fem, 0*fem),
                      child: Text(
                        '9:40PM',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // vector7fi (I12:52;1:10)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.04*fem, 1.48*fem),
                      width: 12.96*fem,
                      height: 11.52*fem,
                      child: Image.asset(
                        'assets/page-1/images/vector-AHS.png',
                        width: 12.96*fem,
                        height: 11.52*fem,
                      ),
                    ),
                    Container(
                      // vectoro2k (I12:52;1:6)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0.4*fem),
                      width: 18*fem,
                      height: 12.6*fem,
                      child: Image.asset(
                        'assets/page-1/images/vector-8vg.png',
                        width: 18*fem,
                        height: 12.6*fem,
                      ),
                    ),
                    Container(
                      // vectorVgG (I12:52;1:8)
                      width: 18*fem,
                      height: 9*fem,
                      child: Image.asset(
                        'assets/page-1/images/vector-ax4.png',
                        width: 18*fem,
                        height: 9*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // scansvgrepocomE84 (12:54)
              left: 168*fem,
              top: 711*fem,
              child: Align(
                child: SizedBox(
                  width: 40*fem,
                  height: 40*fem,
                  child: Image.asset(
                    'assets/page-1/images/scansvgrepocom.png',
                    width: 40*fem,
                    height: 40*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // autogroupqeegHs2 (23pzynm8Ewa3Ug27APqeeG)
              left: 21.0000991821*fem,
              top: 65*fem,
              child: Container(
                width: 295*fem,
                height: 56*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // peperomiaobtusfoliaZJk (12:80)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 227.23*fem, 0*fem),
                      width: 43.77*fem,
                      height: 56*fem,
                      child: Image.asset(
                        'assets/page-1/images/peperomia-obtusfolia.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // stylelineareqz (12:86)
                      margin: EdgeInsets.fromLTRB(0*fem, 14*fem, 0*fem, 0*fem),
                      width: 24*fem,
                      height: 24*fem,
                      child: Image.asset(
                        'assets/page-1/images/stylelinear.png',
                        width: 24*fem,
                        height: 24*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // welcometoteahub924 (12:81)
              left: 20*fem,
              top: 173*fem,
              child: Align(
                child: SizedBox(
                  width: 180*fem,
                  height: 23*fem,
                  child: Text(
                    'Welcome to TeaHub',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lexend',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25*ffem/fem,
                      color: Color(0xff394929),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // settingzoN (12:82)
              left: 343*fem,
              top: 88*fem,
              child: Align(
                child: SizedBox(
                  width: 24*fem,
                  height: 24*fem,
                  child: Image.asset(
                    'assets/page-1/images/setting.png',
                    width: 24*fem,
                    height: 24*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // hivihangaH1n (12:85)
              left: 22*fem,
              top: 136*fem,
              child: Align(
                child: SizedBox(
                  width: 107*fem,
                  height: 23*fem,
                  child: Text(
                    'Hi Vihanga,',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lexend',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            // Navigation Buttons Section
            Positioned(
              // autogrouphs1eKjA (23q1HN6B7mP5fnUSxChs1E)
              left: 25*fem,
              top: 248*fem,
              child: Container(
                width: 327*fem,
                height: 94*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Scan page button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScanPage()),
                          );
                        },
                        child: Text('Scan'),
                      ),
                      SizedBox(width: 20 * fem), 
                    Container(
                      // autogrouprgjnciG (23q1a2H5sYRcLMXhb2RgjN)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                      padding: EdgeInsets.fromLTRB(17*fem, 26*fem, 16*fem, 11*fem),
                      width: 95*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xff4ecb81),
                        borderRadius: BorderRadius.circular(4*fem),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f4ecb81),
                            offset: Offset(4*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupucn8Q8L (23q1h6uczYidmSsw4GucN8)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.5*fem, 10.89*fem),
                            width: 30.5*fem,
                            height: 27.11*fem,
                            child: Image.asset(
                              'assets/page-1/images/auto-group-ucn8.png',
                              width: 30.5*fem,
                              height: 27.11*fem,
                            ),
                          ),
                          Text(
                            // identifyKec (12:95)
                            'Identify',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Lexend',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.25*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Chatbot Button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatbotPage()),
                          );
                        },
                        child: Text('Chatbot'),
                      ),
                      SizedBox(width: 20 * fem), // Adjust spacing as needed
                    Container(
                      // autogroupd8bnegt (23q1pWrwFPUPaC1UDhd8bN)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                      padding: EdgeInsets.fromLTRB(25.5*fem, 20*fem, 26.5*fem, 12*fem),
                      width: 95*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(4*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // assistanthv4 (12:98)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                            width: 34*fem,
                            height: 34*fem,
                            child: Image.asset(
                              'assets/page-1/images/assistant.png',
                              width: 34*fem,
                              height: 34*fem,
                            ),
                          ),
                          Text(
                            // assistQJg (12:96)
                            'Assist',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Lexend',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.25*ffem/fem,
                              color: Color(0xff4ecb81),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Educate button
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EducatePage()),
                          );
                        },
                        child: Text('Educate'),
                    ),
                    Container(
                      // autogroupk4v28Va (23q1wBLVx6h13Dda5EK4V2)
                      padding: EdgeInsets.fromLTRB(20*fem, 23*fem, 13*fem, 13*fem),
                      width: 95*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(4*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // bookalbumsvgrepocomBik (12:140)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 5*fem),
                            width: 34*fem,
                            height: 34*fem,
                            child: Image.asset(
                              'assets/page-1/images/book-albumsvgrepocom.png',
                              width: 34*fem,
                              height: 34*fem,
                            ),
                          ),
                          Text(
                            // educatesba (12:97)
                            'Educate',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Lexend',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.25*ffem/fem,
                              color: Color(0xff4ecb81),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // autogroupqssuzw6 (23q2F5zKxkxmbysDZDQsSU)
              left: 43*fem,
              top: 385*fem,
              child: Container(
                width: 150.33*fem,
                height: 30*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // teaHvC (12:108)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 96.17*fem, 0*fem),
                      child: Text(
                        'Tea',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Lexend',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.25*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      // vectoraPW (12:144)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7.5*fem),
                      width: 10.17*fem,
                      height: 10.17*fem,
                      child: Image.asset(
                        'assets/page-1/images/vector.png',
                        width: 10.17*fem,
                        height: 10.17*fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // SRi (12:117)
              left: 218*fem,
              top: 609*fem,
              child: Align(
                child: SizedBox(
                  width: 62*fem,
                  height: 44*fem,
                  child: Text(
                    '22°',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 36*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // f6mA (12:118)
              left: 218*fem,
              top: 657*fem,
              child: Align(
                child: SizedBox(
                  width: 45*fem,
                  height: 20*fem,
                  child: Text(
                    '71.6 F',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // colomboslbC8 (12:119)
              left: 218*fem,
              top: 560*fem,
              child: Align(
                child: SizedBox(
                  width: 99*fem,
                  height: 20*fem,
                  child: Text(
                    'Colombo, SL',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mondayfBz (12:120)
              left: 218*fem,
              top: 583*fem,
              child: Align(
                child: SizedBox(
                  width: 54*fem,
                  height: 17*fem,
                  child: Text(
                    'Monday',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 14*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}