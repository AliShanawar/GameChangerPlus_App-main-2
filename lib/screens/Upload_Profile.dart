// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import './location.dart';
import 'location.dart';
import 'Upload_Resume.dart';

class UploadProfile extends StatefulWidget {
  UploadProfile(
      {required this.id,
      required this.name,
      required this.mail,
      required this.dob,
      required this.gender});

  final int id;
  final String name;
  final String mail;
  final String dob;
  final String gender;

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  var data;
  var APIURL = "https://gamechanger.amaaizfamilymart.com/api/upload";
  File? pickedImage;

  asyncFileUpload(var file) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(APIURL));
    //add text fields
    request.fields["trainer_id"] = widget.id.toString();
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("image", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0XFF215388),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                        )),
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0XFF215388),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                        )),
                    icon: const Icon(Icons.image),
                    label: const Text(
                      "GALLERY",
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0XFF215388),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                        )),
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Image 14.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 90,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/Group 722.png",
                  ),
                  Image.asset(
                    "assets/images/GameChanger.png",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 100, 0),
                    child: Column(
                      children: const <Widget>[
                        Text(
                          "Upload Profile Picture",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0XFF215388),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigo, width: 5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: ClipOval(
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/Ellipse 31.png",
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              imagePickerOption();
                            },
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton.icon(
                    onPressed: () async {
                      await asyncFileUpload(pickedImage);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UploadResume(
                          id: widget.id,
                          name: widget.name,
                          mail: widget.mail,
                          dob: widget.dob,
                          gender: widget.dob,
                          image: pickedImage,
                        );
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        primary: Color(0XFF215388),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                        )),
                    icon: const Icon(Icons.add_a_photo_sharp),
                    label: const Text('Next')),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
