import 'package:flutter/cupertino.dart';
import 'Zip_Code.dart';
import 'package:flutter/material.dart';
import 'CustomNav_Player.dart';

class Fifth extends StatelessWidget {
  const Fifth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'assets/images/Image 15.png',
            ),
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Hi,Hammad',
                style: TextStyle(color: Color(0XFF215388), fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16)),
                    height: 4,
                    width: 110,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16)),
                    height: 8,
                    width: 30,
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 220, 0, 0),
            child: Column(
              children: [
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
                  padding: EdgeInsets.only(right: 12),
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Search Here',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 280, 0, 0),
            child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ZipCode();
                // }));
              },
              child: Text(
                'Select a Trainer',
                style: TextStyle(fontSize: 20, color: Color(0XFF215388)),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 310, 0, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomNavPlayer()));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomNavPlayer()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Mask Group 1.png'),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Trainer Name',
                          style:
                              TextStyle(color: Color(0XFF215388), fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Fitness Trainer',
                          style: TextStyle(color: Color(0XFF215388)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0XFFFFE814),
                              size: 18,
                            ),
                            Icon(Icons.star,
                                color: Color(0XFFFFE814), size: 18),
                            Icon(Icons.star,
                                color: Color(0XFFFFE814), size: 18),
                            Icon(Icons.star,
                                color: Color(0XFFFFE814), size: 18),
                            Icon(Icons.star,
                                color: Color(0XFFFFE814), size: 18),
                            Text('5.0',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
