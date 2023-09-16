// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget {
  const BackgroundTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 430,
            height: double.maxFinite,
            // height: 1065,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/images/Rectangle1.png'),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/images/Vector1.png'),
                ),
                Positioned(
                  right: 0,
                  top: 500,
                  child: Image.asset('assets/images/Vector2.png'),
                ),
                Positioned(
                  left: 0,
                  top: 450,
                  child: Image.asset('assets/images/Vector3.png'),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                    child: const SizedBox(),
                  ),
                ),
                // Positioned(
                //   left: 58,
                //   top: 731,
                //   child: Container(
                //     width: 313,
                //     height: 56,
                //     decoration: ShapeDecoration(
                //       color: Color.fromARGB(255, 34, 166, 189),
                //       // color: Color(0xFF95B5BB),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
