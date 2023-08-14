import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  ///image File that will hold the image path
  File? _image;

  ///Image Picker object of class ImagePicker()
  final imagePicker = ImagePicker();

  // Function to get images from the camera
  Future getImageFromGallery() async {
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        _image = File(pickImage!.path);
      },
    );
  }

  Future getImageFromCamera() async {
    final pickImage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(
      () {
        _image = File(pickImage!.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _image == null ? const Text("No image selected") : Image.file(_image!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromCamera();
        },
        backgroundColor: Colors.teal.shade800,
        child: const Icon(Icons.photo_camera),
      ),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.only(bottom: 10),
        height: 80,
        // padding: const EdgeInsets.only(left: 30, bottom: 20),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                    height: 50,
                    width: 50,

                    // focusColor: Colors.green,
                    // onTap: getImage,
                    decoration: BoxDecoration(color: Colors.teal.shade800, shape: BoxShape.circle),
                    child: InkWell(
                      onTap: getImageFromGallery,
                      child: const Icon(
                        Icons.file_open_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
