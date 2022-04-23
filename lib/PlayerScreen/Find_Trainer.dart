import 'package:flutter/material.dart';
import 'package:game/PlayerScreen/Trainer_info.dart';
import 'Select_Trainer.dart';
import 'TarinerNearYou.dart';
import 'CustomNav_Player.dart';

class FindTrainer extends StatelessWidget {
  const FindTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomNavPlayer()));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomNavPlayer();
                    }));
                  },
                  // ignore: unnecessary_new
                  child: new Text("",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                )
              ],
            ),
          )),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 84, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Trainer Near You',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF215388),
                      ),
                    ),
                    Text('This will help with knowing you better',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 12,
                          color: Color(0XFF215388),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image(
                  image: AssetImage("assets/images/Mask Group 10.png"),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
            ],
          ),
          Positioned(
            top: 170,
            left: 40,
            child: Image(
              image: AssetImage("assets/images/Group 3900.png"),
              fit: BoxFit.cover,
              height: 70,
            ),
          ),
          Positioned(
            top: 170,
            left: 190,
            child: Image(
              image: AssetImage("assets/images/Group 3900.png"),
              fit: BoxFit.cover,
              height: 70,
            ),
          ),
          Positioned(
            top: 370,
            left: 240,
            child: Image(
              image: AssetImage("assets/images/Group 3900.png"),
              fit: BoxFit.cover,
              height: 70,
            ),
          ),
          Positioned(
            top: 320,
            left: 90,
            child: Image(
              image: AssetImage("assets/images/Group 3900.png"),
              fit: BoxFit.cover,
              height: 70,
            ),
          ),
          Positioned(
              top: 170,
              left: 310,
              child: CircleAvatar(
                  backgroundColor: Color(0xFF215388),
                  radius: 20,
                  child: Icon(
                    Icons.add_location_sharp,
                    color: Colors.white,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(0XFF215388),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.grey)
                      ]),
                  width: double.infinity,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Color(0XFF215388),
                                // backgroundColor: Color(0XFF215388),
                                radius: 40,
                                child: Image.asset(
                                    "assets/images/Mask Group 12.png")),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Trainer Name',
                                  style: TextStyle(
                                      fontFamily: 'Jost',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Fitness Trainer',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        color: Colors.white,
                                        fontSize: 12)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0XFFFFB743),
                                        size: 18,
                                      ),
                                      Icon(Icons.star,
                                          color: Color(0XFFFFB743), size: 18),
                                      Icon(Icons.star,
                                          color: Color(0XFFFFB743), size: 18),
                                      Icon(Icons.star,
                                          color: Color(0XFFFFB743), size: 18),
                                      Icon(Icons.star,
                                          color: Color(0XFFFFB743), size: 18),
                                      Text('5.0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Text('5km away',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        color: Colors.white,
                                        fontSize: 12)),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Six();
                                }));
                              },
                              child: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            // CircleAvatar(
                            //     backgroundColor: Colors.yellow,
                            //     radius: 25,
                            //     child: Text('2')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // body: Stack(
    );
  }
}
