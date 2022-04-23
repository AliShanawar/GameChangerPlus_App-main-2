import 'package:flutter/material.dart';

class ChoosePayment extends StatelessWidget {
  const ChoosePayment({Key? key}) : super(key: key);

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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CustomNavPlayer()));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return CustomNavPlayer();
                    // }));
                  },
                  // ignore: unnecessary_new
                  child: new Text("Choose Payment",
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
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CustomNavPlayer()));
                        },
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CustomNavPlayer()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(color: Colors.grey)],
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Icon metro-paypal.png'),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'PayPal',
                          style:
                              TextStyle(color: Color(0XFF215388), fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ],
      ),
      // body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //   Card(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      //     shadowColor: Colors.white,
      //     child: Stack(children: <Widget>[
      //       Center(
      //         child: Image(
      //             image: AssetImage('assets/images/Icon metro-paypal.png')),
      //       )
      //     ]),
      //   ),
      //   Card(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //     shadowColor: Colors.white,
      //     child: Stack(children: <Widget>[
      //       Center(
      //         child: Image(
      //             image: AssetImage('assets/images/Icon metro-paypal.png')),
      //       )
      //     ]),
      //   )
      // ]));
    );
  }
}

// body: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       Container(
//         margin: EdgeInsets.all(12.0),
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.green),
//         child: Text(
//           "React.js",
//           style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.all(15.0),
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.green),
//         child: Text(
//           "Flutter",
//           style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
//         ),
//       ),
//     ])
