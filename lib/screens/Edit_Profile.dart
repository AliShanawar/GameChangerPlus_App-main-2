// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Trainer_Account.dart';
import 'custom_nav.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? pickedImage;

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
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomNav();
                    }));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return TrainerAccount();
                    // }));
                  },
                  // ignore: unnecessary_new
                  child: new Text("Edit Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/Image 14.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
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
                            onPressed: () {},
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
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Date of Birth',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Sports',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Position',
                  hintStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return TrainerAccount();
                  // }));
                },
                minWidth: double.infinity,
                color: Color(0XFF215388),
                height: 50,
                child: Text(
                  "Save changes",
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
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
