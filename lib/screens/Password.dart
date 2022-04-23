import 'package:flutter/material.dart';
import 'login.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

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
                              "Enter Password",
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
                      decoration: const InputDecoration(
                        hintText: 'New Password',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LogIn();
                        }));
                      },
                      minWidth: double.infinity,
                      color: Color(0XFF215388),
                      height: 50,
                      child: Text(
                        "Confirm",
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
    );
  }
}
