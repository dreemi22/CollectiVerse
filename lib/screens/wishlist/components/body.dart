import 'package:collectiverse/Models/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: demowishlist.length,
            itemBuilder: (context, index) {
         
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Dismissible(
                    key: Key(demowishlist[index].nft.id.toString()),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        return null;
                      } else {
                        setState(() {
                        demowishlist.removeAt(index);
                        });

                        // setState(() {
                        //   wishListProvider?.deleteWishList(
                        //       wishListProvider?.WishList[index].id.toString());
                        // });
                      }
                      return null;
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset('assets/icons/Trash.svg')
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: width <= 600 ? width * 0.25 : width * 0.25,
                            child: AspectRatio(
                              aspectRatio: 0.88,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: const Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                       demowishlist[index].nft.images,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                // child:
                                // demowishlist[index].nfts.images[0].split('/')[0] == 'assets'
                                //     Image.asset(
                                //   demowishlist[index].nfts.images,
                                //   fit: BoxFit.cover,
                                // )
                                // : Image.network(
                                //     data.images[0],
                                //   ),
                                // child: wishListProvider!.getWishList[0].images[0]
                                //             .split('/')[0] ==
                                //         'assets'
                                //     ? Image.asset(
                                //         wishListProvider!.getWishList[0].images[0],
                                //       )
                                //     : Image.network(
                                //         wishListProvider!.getWishList[0].images[0],
                                //       ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  demowishlist[index].nft.name,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(height: 10),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${demowishlist[index].nft.floor} ETH",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 135, 113, 121),
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // },
                  // ),
                  );
            }));
  }
}
