import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Trainer_info.dart';
import 'Find_Trainer.dart';

class TrainerNearYou extends StatefulWidget {
  const TrainerNearYou({Key? key}) : super(key: key);

  @override
  State<TrainerNearYou> createState() => _TrainerNearYouState();
}

class _TrainerNearYouState extends State<TrainerNearYou>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(
        child: Text(
      'Men',
      style: TextStyle(color: Color(0XFF215388)),
    )),
    Tab(
        child: Text(
      'Women',
      style: TextStyle(color: Color(0XFF215388)),
    )),
  ];
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hammad',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Friday,21 Jan', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                    backgroundColor: Color(0XFF215388),
                    radius: 25,
                    child: Image(
                      image: AssetImage('assets/images/Mask Group 12.png'),
                    )),
              ],
            ),
          )),
      body: Container(
        width: double.infinity,
        height: 1200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                DefaultTabController(
                  length: list.length,
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _controller,
                      indicatorColor: Color(0XFF215388),
                      //   onTap: (index){
                      //   _controller.animateTo(_selectedIndex += 1);
                      // },
                      tabs: list),
                ),
                SizedBox(
                  height: 700,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      tabOption(),
                      tabOption(),
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

  Widget tabOption() {
    return Column(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/Group 5.png'),
                      fit: BoxFit.cover,
                      color: Color(0XFF215388),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'FootBall',
                      style: TextStyle(color: Color(0XFF215388)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Select a Trainer',
              style: TextStyle(
                  fontFamily: 'Jost', fontSize: 20, color: Color(0XFF215388)),
            ),
          ),
        ),
        // Container(
        //     height: 200,
        //     width: double.infinity,
        //     child: StreamBuilder(
        //       stream: FirebaseFirestore.instance
        //           .collection('parking_location')
        //           .snapshots(),
        //       builder: (BuildContext context,
        //           AsyncSnapshot<QuerySnapshot> snapshot) {
        //         if (!snapshot.hasData) {
        //           return Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         }
        //         return ListView(
        //           shrinkWrap: true,
        //           scrollDirection: Axis.horizontal,
        //           children: snapshot.data!.docs.map((QueryDocumentSnapshot document) {
        //             Map<String, dynamic> productFromFStore =
        //             document.data()! as Map<String, dynamic>;
        //             //final dynamic data = document.data();
        //             print(productFromFStore);
        //             return Padding(
        //               padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Padding(
        //                       padding: const EdgeInsets.only(left: 10.0),
        //                       child: InkWell(
        //                         onTap: () {
        //                           Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (context) => FindTrainer()));
        //                         },
        //                         child: Image(
        //                           height: 100,
        //                           image: NetworkImage(
        //                               productFromFStore['image']),
        //                           fit: BoxFit.cover,
        //                         ),
        //                       )),
        //                   Padding(
        //                     padding: const EdgeInsets.only(left: 10.0),
        //                     child: Text(
        //                       productFromFStore['name'],
        //                       style: TextStyle(
        //                           fontFamily: 'Jost',
        //                           color: Color(0XFF215388),
        //                           fontSize: 16),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(left: 10.0),
        //                     child: Text(
        //                       'Fitness Trainer',
        //                       style: TextStyle(
        //                           fontFamily: 'Jost', color: Color(0XFF215388)),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 8,
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.only(left: 10.0),
        //                     child: Row(
        //                       children: [
        //                         Icon(
        //                           Icons.star,
        //                           color: Color(0XFFFFE814),
        //                           size: 18,
        //                         ),
        //                         Icon(Icons.star,
        //                             color: Color(0XFFFFE814), size: 18),
        //                         Icon(Icons.star,
        //                             color: Color(0XFFFFE814), size: 18),
        //                         Icon(Icons.star,
        //                             color: Color(0XFFFFE814), size: 18),
        //                         Icon(Icons.star,
        //                             color: Color(0XFFFFE814), size: 18),
        //                         Text('5.0',
        //                             style: TextStyle(
        //                                 color: Colors.black, fontSize: 12)),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           }).toList(),
        //         );
        //       },
        //     )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => FindTrainer()));
              // },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Trainers',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black,
                          fontSize: 20)),
                  TextSpan(
                      text: ' Near you',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: GoogleMap(
                    zoomGesturesEnabled: true,
                    initialCameraPosition: initialCameraPosition,
                    markers: markers,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                top: 20,
                left: 310,
                child: InkWell(
                  onTap: () async {
                    Position position = await _determinePosition();

                    googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                            target:
                                LatLng(position.latitude, position.longitude),
                            zoom: 14)));

                    markers.clear();

                    markers.add(Marker(
                        markerId: const MarkerId('currentLocation'),
                        position:
                            LatLng(position.latitude, position.longitude)));
                    // if (position.latitude != null &&
                    //     position.longitude != null) {
                    //   FirebaseFirestore.instance
                    //       .collection('parking_location')
                    //       .add({
                    //     'location':
                    //     GeoPoint(position.latitude, position.longitude),
                    //     'name': widget.name,
                    //     'id': widget.id.toString(),
                    //     'email': widget.mail,
                    //     'image': widget.image.toString(),
                    //     'dob': widget.dob,
                    //     'drop': widget.drop,
                    //     'dropped': widget.dropped,
                    //     'gender': widget.gender,
                    //   });
                    // }
                    // setState(() {});
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.blue.shade700,
                      radius: 20,
                      child: Icon(
                        Icons.add_location_sharp,
                        color: Colors.white,
                      )),
                )),
          ],
        ),
      ],
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
