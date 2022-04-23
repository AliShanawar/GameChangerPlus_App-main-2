// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:game/screens/Request_Player.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import './sign_up.dart';
import 'ForgetPassword.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isLoading = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var APIURL = "https://gamechanger.amaaizfamilymart.com/api/TrainerLogin";

  Future<void> login() async {
    Map mapeddate = {
      'email': _email.text,
      'password': _password.text,
    };
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      var response = await http.post(Uri.parse(APIURL), body: mapeddate);
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RequestPlayer();
        }));
      } else
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank field not allowed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                  height: 800,
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
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
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 26,
                                  color: Color(0XFF215388),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter  email";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        onSaved: (email) {},
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }

                          return null;
                        },
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      MaterialButton(
                        onPressed: () {
                          login();
                        },
                        minWidth: double.infinity,
                        color: Color(0XFF215388),
                        height: 50,
                        child: Text(
                          "Sign Up",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                              child: Text("Don't have an account? ")),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgetPasswordTrainer();
                                }));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgetPasswordTrainer();
                          }));
                        },
                        child: Text(
                          'Forgot Password?',
                        ),
                      )
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
