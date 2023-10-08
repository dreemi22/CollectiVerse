import 'package:collectiverse/screens/detailScreen/components/body.dart';
import 'package:flutter/material.dart';

import '../../Models/nfts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
static String routeName = "/DetailScreen";
  @override
  Widget build(BuildContext context) {
    final ProductDetails arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetails;
    return Scaffold(
      appBar: AppBar(),
      body: Body(
        nfts: arguments.nfts,
      ),
    );
  }
}

class ProductDetails {
  final NFTS nfts;
  ProductDetails({required this.nfts});
}
