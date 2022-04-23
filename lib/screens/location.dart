// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Trainer_Account.dart';
import 'custom_nav.dart';
import 'package:location/location.dart';
import 'Upload_Resume.dart';

class LocationMap extends StatefulWidget {
  LocationMap(
      {required this.id,
      required this.name,
      required this.mail,
      required this.dob,
      required this.gender,
      required this.image,
      required this.drop,
      required this.dropped});

  final int id;
  final String name;
  final String mail;
  final String dob;
  final String gender;
  final String drop;
  final String dropped;
  var image;

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  // void _onMapCreated(GoogleMapController _cntlr)
  // {
  //   _controller = _cntlr;
  //   _location.onLocationChanged.listen((l) {
  //     _controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
  //       ),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 160),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return UploadResume();
                    // }));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TrainerAccount(
                          // id:widget.id,
                          // name: widget.name,
                          // mail: widget.mail,
                          // dob: widget.dob,
                          // gender: widget.dob,
                          // image: widget.image,
                          // drop: widget.drop,
                          // dropped: widget.dropped,
                          );
                    }));
                  },
                  // ignore: unnecessary_new
                  child: new Text("Proceed",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Stack(
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
                        'Add Your Location',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF215388),
                        ),
                      ),
                      Text('This will help with knowing you better',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF215388),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 700,
                  child: GoogleMap(
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
                top: 170,
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
                    if (position.latitude != null &&
                        position.longitude != null) {
                      FirebaseFirestore.instance
                          .collection('parking_location')
                          .add({
                        'location':
                            GeoPoint(position.latitude, position.longitude),
                        'name': widget.name,
                        'id': widget.id.toString(),
                        'email': widget.mail,
                        'image': widget.image.toString(),
                        'dob': widget.dob,
                        'drop': widget.drop,
                        'dropped': widget.dropped,
                        'gender': widget.gender,
                      });
                    }
                    setState(() {});
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
      ),
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
