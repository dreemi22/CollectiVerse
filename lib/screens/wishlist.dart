import 'package:collectiverse/Models/nfts.dart';
import 'package:collectiverse/screens/homescreen/components/homescreen.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 70),
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  backgroundColor: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 70),
                child: Column(
                  children: [
                    Text(
                      'Hi User!\nWelcome Back',
                      style: TextStyle(
                        color: Color(0xFF123035),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 30,
                crossAxisSpacing: 5,
                childAspectRatio: 0.90,
              ),
              itemCount: demoNfts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  press: () {},
                  nfts: demoNfts[index],
                  width: width,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
