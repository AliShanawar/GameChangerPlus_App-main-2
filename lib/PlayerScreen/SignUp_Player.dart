import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'Select_Sports.dart';
import 'Zip_Code.dart';
import 'Login_Player.dart';
import 'package:http/http.dart' as http;

class SignUpPlayer extends StatefulWidget {
  const SignUpPlayer({Key? key}) : super(key: key);

  @override
  State<SignUpPlayer> createState() => _SignUpPlayerState();
}

class _SignUpPlayerState extends State<SignUpPlayer> {
  var data;
  String _date = "Not set";
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Future RegistrationUser() async {
    // url to registration php script
    var APIURL = "https://gamechanger.amaaizfamilymart.com/api/RegisterPlayer";

    //json maping user entered details
    Map mapeddate = {

      'name': _name.text,
      'email': _email.text,
      'Date_of_Birth': _dateOfBirth.text,
      'password': _password.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),
        body: mapeddate,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    //getting response from php code, here
    data = jsonDecode(reponse.body.toString());
    setState(() {
      data = this.data;
    });
    print("DATA: ${data}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key:_formkey,
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
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 23,
                      ),
                      Image.asset(
                        "assets/images/Group 722.png",
                      ),
                      Image.asset(
                        "assets/images/GameChanger.png",
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Sign Up",
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter name";
                          }
                          return null;
                        },
                        onSaved: (name) {},
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: TextStyle(fontFamily: 'Jost'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter  email";
                          }
                          // if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          //     .hasMatch(value)) {
                          //   return "Email Already Exist";
                          // }
                          return null;
                        },
                        onSaved: (email) {},
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(fontFamily: 'Jost'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Date of Birth";
                          }
                          return null;
                        },
                        onSaved: (dateofBirth) {
                          dateofBirth = _date;
                        },
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          DatePicker.showDatePicker(
                            context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                              backgroundColor: Color(0XFF215388),
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31),
                            onConfirm: (date) {
                              print('confirm $date');
                              _dateOfBirth.text =
                              '${date.year} - ${date.month} - ${date.day}';
                              setState(() {});
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        controller: _dateOfBirth,
                        decoration: const InputDecoration(
                          hintText: 'Date of birth',
                          hintStyle: TextStyle(fontFamily: 'Jost'),
                        ),
                      ),
                      SizedBox(
                        height: 8,
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
                            hintStyle: TextStyle(fontFamily: 'Jost')),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter re-password";
                          }
                          if (_password.text != _confirmpassword.text) {
                            return "Password Do not match";
                          }
                          return null;
                        },
                        controller: _confirmpassword,
                        decoration: const InputDecoration(
                          hintText: 'Re-Enter Password',
                          hintStyle: TextStyle(fontFamily: 'Jost'),
                        ),
                      ),
                      SizedBox(height: 30),
                      MaterialButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await RegistrationUser();

                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UploadResume(id: _firestore.collection('users').id)));
                            // setState(() {
                            //   loading = false;
                            // });

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Fourth(
                                  //    id:data['user']['id']
                                  );
                                }));
                          }
                          print(data['user']['id']);

                        },
                        minWidth: double.infinity,
                        color: Color(0XFF215388),
                        height: 45,
                        child: Text(
                          "Sign Up",
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LogInPlayer();
                              }));
                            },
                            child: Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Color(0XFF215388),
                                fontFamily: 'Jost',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LogInPlayer();
                                }));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily: 'Jost',
                                    color: Color(0XFF215388),
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
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
