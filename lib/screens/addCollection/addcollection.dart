import 'package:collectiverse/screens/addCollection/components/body.dart';
import 'package:flutter/material.dart';

class AddCollections extends StatefulWidget {
  const AddCollections({super.key});

  @override
  State<AddCollections> createState() => _AddCollectionsState();
}

class _AddCollectionsState extends State<AddCollections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
