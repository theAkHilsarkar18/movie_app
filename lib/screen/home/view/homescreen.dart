import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_app/screen/home/controller/homecontroller.dart';
import 'package:movie_app/screen/home/model/homemodel.dart';
import 'package:movie_app/screen/home/provider/homeprovider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

HomeController homeController = Get.put(HomeController());

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtName = TextEditingController();

    Homeprovider homeproviderFalse = Provider.of(context, listen: false);
    Homeprovider homeproviderTrue = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff251B37),
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse
                .movieApiCalling("${homeproviderFalse.movieName}"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                  "${snapshot.error}",
                  style: TextStyle(color: Colors.white),
                );
              } else if (snapshot.hasData) {
                Homemodel? h1 = snapshot.data;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 300,
                        child: TextField(
                          controller: txtName,
                          style: TextStyle(
                              color: Color(0xffFFECEF), letterSpacing: 1),
                          cursorColor: Color(0xffFFECEF),
                          decoration: InputDecoration(
                            labelText: "Search",
                            labelStyle: TextStyle(
                                color: Color(0xffFFECEF), letterSpacing: 1),
                            prefixIcon: Icon(Icons.movie_creation_outlined,
                                color: Color(0xffFFECEF)),
                            suffixIcon: InkWell(
                                onTap: () {
                                  homeproviderFalse
                                      .changeName("${txtName.text}");
                                  homeproviderFalse
                                      .movieApiCalling("${txtName.text}");
                                },
                                child: Icon(Icons.arrow_forward_outlined,
                                    color: Color(0xffFFECEF))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffFFECEF), width: 1.5)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffFFECEF))),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff251B37),
                          borderRadius: BorderRadiusDirectional.circular(30),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(30),
                            child: Image.network(
                              "${h1!.d![0].i!.imageUrl}",
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${h1.d![0].l}",
                                  style: TextStyle(
                                      color: Color(0xffFFECEF),
                                      letterSpacing: 1,
                                      fontSize: 25)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff372948),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                alignment: Alignment.center,
                                child: Text("${h1.d![0].qid}",
                                    style: TextStyle(
                                        color: Color(0xffFFECEF),
                                        letterSpacing: 1)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Actor : ",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                  Text("${h1.d![0].s}",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Year : ",
                                    style: TextStyle(
                                        color: Color(0xffFFECEF),
                                        letterSpacing: 1,
                                        fontSize: 13)),
                                Text("${h1.d![0].y}",
                                    style: TextStyle(
                                        color: Color(0xffFFECEF),
                                        letterSpacing: 1,
                                        fontSize: 13)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Rating : ",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                  Text("4.8",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 16),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("Rank : ",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                  Text("${h1.d![0].rank}",
                                      style: TextStyle(
                                          color: Color(0xffFFECEF),
                                          letterSpacing: 1,
                                          fontSize: 13)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Type : ",
                                    style: TextStyle(
                                        color: Color(0xffFFECEF),
                                        letterSpacing: 1,
                                        fontSize: 13)),
                                Text("${h1.d![0].q}",
                                    style: TextStyle(
                                        color: Color(0xffFFECEF),
                                        letterSpacing: 1,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFFECEF),
          child: Icon(Icons.location_pin, color: Color(0xff251B37)),
          onPressed: () async {
            var status = await Permission.location.status;
            if (status.isDenied) {
              // openAppSettings();
              status = await Permission.location.request();
            } else if (status.isGranted) {
              print("granted");
              Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              double longitude = position.longitude;
              double latitude = position.latitude;
              homeproviderTrue.longitude = longitude;
              homeproviderTrue.latitude = latitude;
              List<Placemark> placemark =
                  await placemarkFromCoordinates(latitude, longitude);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20)),
                  backgroundColor: Color(0xffFFECEF),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${placemark[0]}"),
                      SizedBox(height: 20,),
                      FloatingActionButton(onPressed: () {
                        Navigator.pushNamed(context, 'map');
                      },child: Icon(Icons.location_pin,color: Color(0xffFFECEF)),backgroundColor: Color(0xff251B37),)
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
