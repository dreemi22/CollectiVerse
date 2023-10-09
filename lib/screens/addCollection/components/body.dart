import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../profile.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? filePath;

  
  

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });

      PickedImage pickedImage = PickedImage(filePath!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(pickedImage: pickedImage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Add to your Collection : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Floor Price : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  // width: 3,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              _pickFile();
            },
            child: Center(
              child: DottedBorder(
                dashPattern: [27, 10],
                child: Container(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Text(
                      'Upload Image',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          SizedBox(
            width: 301,
            height: 79,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 198, 231, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Upload NFT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class PickedImage {
  final String imagePath;

  PickedImage(this.imagePath);
}
