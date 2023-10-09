import 'package:collectiverse/screens/addCollection/addcollection.dart';
import 'package:collectiverse/screens/addCollection/components/body.dart';
import 'package:collectiverse/screens/detailScreen/detailscreen.dart';
import 'package:collectiverse/screens/homescreen/components/homescreen.dart';
import 'package:flutter/material.dart';

import '../Models/nfts.dart';

class ProfileScreen extends StatefulWidget {
  final PickedImage? pickedImage;
  const ProfileScreen({
    super.key,
    this.pickedImage,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 59,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Andrew345',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Collection : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCollections()));
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: demoNfts2.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      press: () {
                        Navigator.pushNamed(
                          context,
                          DetailScreen.routeName,
                          arguments: ProductDetails(
                            nfts: demoNfts2[index],
                          ),
                        );
                      },
                      nfts: demoNfts2[index],
                      width: width,
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}

class NewProductCard extends StatefulWidget {
  const NewProductCard(
      {super.key,
      required this.press,
      // required this.nfts,
      required this.width,
      required this.image,
      required this.name,
      this.floor,
      this.volume});
  final double width;
  final String image;
  final String name;
  final dynamic floor;
  final dynamic volume;
  // final NFTS nfts;
  final GestureTapCallback press;
  @override
  State<NewProductCard> createState() => _NewProductCardState();
}

class _NewProductCardState extends State<NewProductCard> {
  bool wishListBool = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 25.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: widget.width),
                height: 150,
                width: 195,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Floor : ${widget.floor}ETH",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Volume : ${widget.volume}ETH",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        wishListBool = !wishListBool;
                        if (wishListBool) {
                          //code for adding product to wishlist page
                        }
                      });
                    },
                    child: wishListBool == false
                        ? Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
