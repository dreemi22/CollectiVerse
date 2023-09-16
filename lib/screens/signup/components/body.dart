import 'package:collectiverse/screens/signup/components/signup_form.dart';
import 'package:flutter/material.dart';

import '../../background/background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundTheme(),
        Positioned.fill(
          // top: 60,
          // left: 50,
          // right: 50,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset('assets/images/logo.png'),
                const Text(
                  'CollectiVerse',
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 50,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Luxury Unchained, \nNFTs Unleashed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF123035),
                    fontSize: 31,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0.97,
                    letterSpacing: 0.93,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Signup_form(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
