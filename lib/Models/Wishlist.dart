import 'package:collectiverse/Models/nfts.dart';


class Wishlist {
  final NFTS nft;

  Wishlist({required this.nft});
}

List<Wishlist> demowishlist = [
  Wishlist(nft: demoNfts1[0]),
  Wishlist(nft: demoNfts2[0]),
  Wishlist(nft: demoNfts3[0]),
  Wishlist(nft: demoNfts4[0]),
];
