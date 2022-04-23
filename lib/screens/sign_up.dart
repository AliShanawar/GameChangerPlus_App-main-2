import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:game/screens/Upload_Resume.dart';
import 'Registration_code.dart';
import 'Upload_Profile.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List userList = [];
  String dropdownValue = 'Male';
  var data;
  String _date = "Not set";
  bool isLoading = false;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);

  Future RegistrationUser(var _date) async {
    // url to registration php script
    var APIURL = "https://gamechanger.amaaizfamilymart.com/api/RegisterTrainer";

    //json maping user entered details
    Map mapeddate = {
      'random_id': _date,
      'name': _name.text,
      'email': _email.text,
      'Date_of_Birth': _dateOfBirth.text,
      'Gender': dropdownValue,
      'password': _password.text,
      'confirmed_pass': _confirmpassword.text,
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
    // RegistrationUser() async {
    //   http.Response response = await http.post(
    //       Uri.parse(
    //           'https://gamechanger.amaaizfamilymart.com/api/RegisterTrainer'),
    //       body: {
    //         'id':DateTime.now().millisecondsSinceEpoch.toString(),
    //         'name': _name.text,
    //         'email': _email.text,
    //         'Date_of_Birth': _dateOfBirth.text,
    //         'Gender': _gender.text,
    //         'password': _password.text,
    //         'confirmed_pass': _confirmpassword.text,
    //       });
    //   if (response.statusCode == 200) {
    //
    //     setState(() {
    //       userList = json.decode(response.body);
    //     });
    //     print(userList);
    //     return userList;
    //   }
    //   print(userList.toString());
    // }
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Stack(
              children: [
                Column(
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
                                hintStyle:
                                    TextStyle(fontFamily: 'Jost', fontSize: 14)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                             // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                              if (value!.isEmpty) {
                                return "Please enter  email";
                              }
    // if (!isEmail(_email.text)) {
    // return 'Please enter a valid ';
    // }
    },
                            onSaved: (email) {},
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Email Address',
                              hintStyle:
                                  TextStyle(fontFamily: 'Jost', fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextFormField(
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
                                hintStyle:
                                    TextStyle(fontFamily: 'Jost', fontSize: 14)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          DropdownButtonFormField(
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            onSaved: (gender) {},
                            decoration: const InputDecoration(
                                hintText: 'Gender',
                                hintStyle:
                                    TextStyle(fontFamily: 'Jost', fontSize: 14)),
                            items: <String>['Female', 'Male', 'Other']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 4,
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
                                hintStyle:
                                    TextStyle(fontFamily: 'Jost', fontSize: 14)),
                          ),
                          SizedBox(
                            height: 4,
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
                                hintText: 'Confirm Password',
                                hintStyle:
                                    TextStyle(fontFamily: 'Jost', fontSize: 14)),
                          ),
                          SizedBox(height: 30),
                          MaterialButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                             try { await RegistrationUser(DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString());
                             ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 backgroundColor: Colors.blueGrey,
                                 content: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text('Register Successful'),
                                 ),
                                 duration: Duration(seconds: 5),
                               ),
                             );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UploadProfile(
                                      id: data['user']['id'],
                                      name: data['user']['name'],
                                      mail: data['user']['email'],
                                      dob: data['user']['Date_of_Birth'],
                                      gender: data['user']['Gender']);
                                }));
                              }on Exception catch(e){
                               showDialog(
                                 context: context,
                                 builder: (ctx) => AlertDialog(
                                   title: Text(' Ops! Check your Connection!'),
                                   content: Text('Try After some time}'),
                                   actions: [
                                     TextButton(
                                       onPressed: () {
                                         Navigator.of(ctx).pop();
                                       },
                                       child: Text('Okay'),
                                     )
                                   ],
                                 ),
                               );
                             }
                              }
                              print(data['user']['id']);
                            },
                            minWidth: double.infinity,
                            color: Color(0XFF215388),
                            height: 45,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Jost',
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
                                    return LogIn();
                                  }));
                                },
                                child: Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontSize: 16,
                                    color: Color(0XFF215388),
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
                                      return LogIn();
                                    }));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Jost'),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
