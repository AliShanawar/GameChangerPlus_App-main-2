import 'package:flutter/material.dart';
import 'Password.dart';

class ForgetPasswordTrainer extends StatelessWidget {
  const ForgetPasswordTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: Stack(
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Enter Your Email",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 22,
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
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(fontFamily: 'Jost'),
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Password();
                      }));
                    },
                    minWidth: double.infinity,
                    color: Color(0XFF215388),
                    height: 50,
                    child: Text(
                      "Next",
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
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
