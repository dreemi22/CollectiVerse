import 'package:collectiverse/screens/BottomNavBar/bottomnavbar.dart';
import 'package:collectiverse/screens/ConnectWallet/authenticatewallet.dart';
import 'package:collectiverse/screens/background/background.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundTheme(),
          Positioned.fill(
            // top: 200,
            // left: 50,
            // right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 180),
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
                  height: 200,
                ),
                SizedBox(
                  width: 313,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xB2123035),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Connect Wallet',
                      style: TextStyle(
                        color: Color(0xFFC6E7ED),
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthenticateWallet(),
                        ));
                  },
                  child: Text(
                    'Already have an Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
