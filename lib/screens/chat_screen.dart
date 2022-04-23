import 'package:flutter/material.dart';
import 'custom_nav.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blue.shade700,
                        radius: 15,
                        child: Image(
                          image: AssetImage('assets/images/Mask Group 12.png'),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Trainer Name'),
                  ],
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(44, 32, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          color: Color(0XFF215388)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore "
                          "magna aliqua. Ut enim ad minim veniam,"
                          " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Jost',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 44, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          color: Color(0XFF002f36)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore "
                          "magna aliqua. Ut enim ad minim veniam,"
                          " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Jost',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Monday,10:40 am',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(44, 32, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          color: Color(0XFF215388)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                          "sed do eiusmod tempor incididunt ut labore et dolore "
                          "magna aliqua. Ut enim ad minim veniam,"
                          " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Jost',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.link),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              width: 230,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Say Something',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Color(0XFF215388),
              child: Icon(
                Icons.arrow_forward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
