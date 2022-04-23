// ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class UploadResume extends StatefulWidget {
//   @override
//   State<UploadResume> createState() => _UploadResumeState();
// }

// class _UploadResumeState extends State<UploadResume> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 400),
//       padding: const EdgeInsets.all(20),
//       alignment: Alignment.center,
//       child: ElevatedButton(
//           child: const Text('Upload Resume'),
//           onPressed: () async {
//             final result =
//                 await FilePicker.platform.pickFiles(allowMultiple: false);
//             if (result == null) {
//               return;
//             }
//             openfile(result.files);

//             final file = result.files.first;
//             // Openfile(file);
//             print('Name: ${file.name}');
//             print('Length: ${file.bytes}');
//             print('size: ${file.size}');
//             print('Path: ${file.path}');
//             print('Extension: ${file.extension}');
//             final newFile = await saveFilePermanently(file);
//             print('From path: ${file.path}');
//             print('To path: ${newFile.path}');
//           }),
//     );
//   }

//   Future<File> saveFilePermanently(PlatformFile file) async {
//     final appStorage = await getApplicationDocumentsDirectory();
//     final newFile = File('${appStorage.path}/${file.name}');
//     return File(file.path!).copy(newFile.path);
//   }

//   void Openfile(PlatformFile file) {
//     if (file != null) {
//       OpenFile.open(file.path);
//     }
//   }

//   void openfile(List<PlatformFile> files) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('File Picker Example'),
//         ),
//         body: ListView.builder(
//           itemCount: files.length,
//           itemBuilder: (BuildContext context, int index) {
//             final file = files[index];
//             return ListTile(
//               title: Text(file.name),
//               onTap: () {
//                 Openfile(file);
//               },
//             );
//           },
//         ),
//       );
//     }));
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game/screens/select_sports.dart';
import 'location.dart';
import 'package:http/http.dart' as http;

class UploadResume extends StatefulWidget {
  UploadResume(
      {required this.id,
      required this.name,
      required this.mail,
      required this.dob,
      required this.gender,
      required this.image});

  final int id;
  final String name;
  final String mail;
  final String dob;
  final String gender;
  var image;

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
  TextEditingController about = TextEditingController();
  TextEditingController session = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future UploadResume() async {
    // url to registration php script
    var APIURL = "https://gamechanger.amaaizfamilymart.com/api/TrainerDetail";

    //json maping user entered details
    Map mapeddate = {
      'About': about.text,
      'Sessios_Details': session.text,
      'trainer_id': widget.id.toString(),
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),
        body: mapeddate,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Image 14.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  // color: Colors.black
                  width: MediaQuery.of(context).size.width,
                  height: 750,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/Group 722.png",
                      ),
                      Image.asset(
                        "assets/images/GameChanger.png",
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Add your Details",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'Jost',
                                  color: Color(0XFF215388),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Fill in Details";
                          }
                          return null;
                        },
                        onSaved: (val) {},
                        controller: about,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,

                        decoration: const InputDecoration(
                            hintText: 'Qualification',
                            hintStyle: TextStyle(
                              fontFamily: 'Jost',
                            )),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Fill in Details";
                          }
                          return null;
                        },
                        onSaved: (val) {},
                        controller: session,
                        decoration: const InputDecoration(
                          hintText: 'Session Details',
                        ),
                      ),
                      SizedBox(
                        height: 190,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          await UploadResume();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return selectSports(id: widget.id,
                              name: widget.name,
                              mail: widget.mail,
                              dob: widget.dob,
                              gender: widget.dob,
                              image: widget.image,);
                          }));
                        },
                        minWidth: double.infinity,
                        color: Color(0XFF215388),
                        height: 50,
                        child: Text(
                          "Finish Sign Up",
                          style: TextStyle(
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
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
