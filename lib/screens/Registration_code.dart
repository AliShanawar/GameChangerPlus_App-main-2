// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './Upload_Profile.dart';
import './Upload_Resume.dart';

class RegistrationCode extends StatefulWidget {
  RegistrationCode({required this.id});
  final String id;

  @override
  State<RegistrationCode> createState() => _RegistrationCodeState();
}

class _RegistrationCodeState extends State<RegistrationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
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
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 26,
                                color: Color(0XFF215388),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your Registration code',
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return UploadResume(id:widget.id);
                        // }));
                      },
                      minWidth: double.infinity,
                      color: Color(0XFF215388),
                      height: 50,
                      child: Text(
                        "Next",
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
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
