import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Disease extends StatelessWidget {
  const Disease({Key? key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // diseaseSYf (128:230)
        padding: EdgeInsets.fromLTRB(0 * fem, 7 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/bgimag.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // navvTq (128:231)
              margin: EdgeInsets.fromLTRB(19 * fem, 0 * fem, 14 * fem, 284 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // pmePq (I128:231;1:11)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 222 * fem, 0 * fem),
                    child: Text(
                      '9:40PM',
                      style: GoogleFonts.poppins(
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup1vq1W4f (9njwAy638d8DChbuKN1VQ1)
              padding: EdgeInsets.fromLTRB(11 * fem, 38 * fem, 6 * fem, 0 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30 * fem),
                  topRight: Radius.circular(30 * fem),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // greyblightpestalotiopsisBwV (128:237)
                    margin: EdgeInsets.fromLTRB(7 * fem, 0 * fem, 0 * fem, 23 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 136 * fem,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Grey Blight\n',
                          ),
                          TextSpan(
                            text: 'Pestalotiopsis',
                            style: GoogleFonts.poppins(
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5 * ffem / fem,
                              color: const Color(0xff4ecb81),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // autogroupnverEYP (9njwT8HnBeUeJnzCQvNvER)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 38 * fem),
                    padding: EdgeInsets.fromLTRB(13.5 * fem, 4.5 * fem, 37.5 * fem, 4.5 * fem),
                    width: double.infinity,
                    height: 47 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xffe5ffd6),
                      borderRadius: BorderRadius.circular(28 * fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogrouprqsbiTZ (9njwaCvKJemfjtLRtArqsB)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
                          width: 180 * fem,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/rectangle-8.png',
                              ),
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Description',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          // treatmentplanZj5 (130:249)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Treatment Plan',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogrouphapm4vj (9njwfnbMKPzQVYfnjdHapm)
                    margin: EdgeInsets.fromLTRB(13.49 * fem, 0 * fem, 12.49 * fem, 35 * fem),
                    padding: EdgeInsets.fromLTRB(24.51 * fem, 13.63 * fem, 24.51 * fem, 6 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0x33088a6a),
                      borderRadius: BorderRadius.circular(19.4736843109 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupghz5m4T (9njwpHMCGCk31f64u8GHz5)
                          margin: EdgeInsets.fromLTRB(1.63 * fem, 0 * fem, 96 * fem, 19.63 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // headsetsvgrepocomHHh (188:315)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20.63 * fem, 0 * fem),
                                width: 21.75 * fem,
                                height: 21.75 * fem,
                                child: Image.asset(
                                  'assets/images/headsetsvgrepocom.png',
                                  width: 21.75 * fem,
                                  height: 21.75 * fem,
                                ),
                              ),
                              Container(
                                // listentothesymptomsBts (188:314)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'Listen to the symptoms',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupyejqVef (9njwtwt69uCGEn2LbbYeJq)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 89 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // playbuttonsvgrepocomE6T (188:322)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17.66 * fem, 0.66 * fem),
                                width: 26.34 * fem,
                                height: 26.34 * fem,
                                child: Image.asset(
                                  'assets/images/play-buttonsvgrepocom.png',
                                  width: 26.34 * fem,
                                  height: 26.34 * fem,
                                ),
                              ),
                              Container(
                                // usetheplaybuttontolistentothec (188:326)
                                constraints: BoxConstraints(
                                  maxWidth: 150 * fem,
                                ),
                                child: Text(
                                  'Use the play button to  \nlisten to the content',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13 * ffem,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupfjbbRwd (9njx5C624LsEDZHy9XFjbB)
                    margin: EdgeInsets.fromLTRB(9 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupbg5kxwZ (9njxCBtMttYa4EhNhEBG5K)
                          margin: EdgeInsets.fromLTRB(0 * fem, 9 * fem, 14 * fem, 0 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // vectorh8T (188:329)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 32 * fem),
                                width: 8 * fem,
                                height: 8 * fem,
                                child: Image.asset(
                                  'assets/images/vector-8MD.png',
                                  width: 8 * fem,
                                  height: 8 * fem,
                                ),
                              ),
                              Container(
                                // vectorQoZ (188:330)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 37 * fem),
                                width: 8 * fem,
                                height: 8 * fem,
                                child: Image.asset(
                                  'assets/images/vector-SuD.png',
                                  width: 8 * fem,
                                  height: 8 * fem,
                                ),
                              ),
                              Container(
                                // vectorhXm (188:331)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 36 * fem),
                                width: 8 * fem,
                                height: 8 * fem,
                                child: Image.asset(
                                  'assets/images/vector-pGX.png',
                                  width: 8 * fem,
                                  height: 8 * fem,
                                ),
                              ),
                              Container(
                                // vectorBC3 (188:332)
                                width: 8 * fem,
                                height: 8 * fem,
                                child: Image.asset(
                                  'assets/images/vector-UWj.png',
                                  width: 8 * fem,
                                  height: 8 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // smallovalpaleyellowgreenspotsf (188:327)
                          constraints: BoxConstraints(
                            maxWidth: 327 * fem,
                          ),
                          child: Text(
                            'Small, oval, pale yellow-green spots first appear on young leaves.\n\nOften the spots are surrounded by a narrow, yellow zone.\n\nAs the spots grow and turn brown or gray, concentric rings with scattered, tiny black dots become visible and eventually the dried tissue falls, leading to defoliation\n\nLeaves of any age can be affected.\n\n\n\n\n',
                            style: GoogleFonts.roboto(
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w100,
                              height: 1.1725 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
