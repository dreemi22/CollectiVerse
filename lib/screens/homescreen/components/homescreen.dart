import 'package:collectiverse/Models/nfts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  child: Text(
                    'Hi User!\nWelcome Back',
                    style: TextStyle(
                      color: Color(0xFF123035),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 55,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  // onChanged: (value) {
                  //   //search value
                  // },
                  readOnly: true,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => SearchScreen(),
                    //     ));
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Explore Collections',
                    hintStyle: const TextStyle(fontSize: 25),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.9),
                      size: 35,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: width <= 600 ? width * 0.2 : width * 0.2,
                        vertical: width <= 600 ? width * 0.02 : width * 0.02),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),

            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 0.90,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: demoNfts.length,
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                // return Container(
                //   height: 100,
                //   width: 100,
                //   color: Colors.amber,
                // );
                return ProductCard(
                  press: () {},
                  nfts: demoNfts[index],
                  width: width,
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.press,
      required this.nfts,
      required this.width});
  final double width;

  final NFTS nfts;
  final GestureTapCallback press;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool wishListBool = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 25.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 20.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.nfts.images,
                    ),
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
                          widget.nfts.name,
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
                          "Floor : ${widget.nfts.floor}ETH",
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
                          "Total Volume : ${widget.nfts.volume}ETH",
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
    );
  }
}

/*

return GestureDetector(
      onTap: () {},
      child: Container(
        height: 500,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.amber,
          // color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                widget.nfts.images,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.width < 600 ? 5 : 10),
              child: Text(
                widget.nfts.name,
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.width < 600 ? 5 : 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Eth:${widget.nfts.floor}",
                    style: TextStyle(
                        fontSize: widget.width <= 600
                            ? widget.width * 0.055
                            : widget.width * 0.01,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(30),
                  //   onTap: () {
                  //     // setState(() {
                  //     //   wishListBool = !wishListBool;
                  //     // });
                  //     // if (wishListBool) {
                  //     //   wishListProvider.addWishListData(
                  //     //     WishlistId: widget.product.id,
                  //     //     WishlistName: widget.product.title,
                  //     //     WishlistImage: widget.product.images.toList(),
                  //     //     WishlistPrice: widget.product.price,
                  //     //     WishlistDesc: widget.product.description,
                  //     //   );
                  //     //   Fluttertoast.showToast(
                  //     //       msg: 'Product has been wishlisted.');
                  //     // } else {
                  //     //   wishListProvider.deleteWishList(widget.product.id);
                  //     //   Fluttertoast.showToast(
                  //     //       msg: 'Product has been removed from wishlist');
                  //     // }
                  //   },
                  //   child: Container(
                  //     width: widget.width <= 600
                  //         ? widget.width * 0.09
                  //         : widget.width * 0.01,
                  //     height: widget.width <= 600
                  //         ? widget.width * 0.06
                  //         : widget.width * 0.01,
                  //     decoration: BoxDecoration(
                  //       color: kSecondaryColor.withOpacity(0.15),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: SvgPicture.asset('assets/icons/Heart Icon_2.svg',
                  //         color: wishListBool == false
                  //             ? Colors.grey
                  //             : const Color(0xFFFF4848)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  
  
  


*/
