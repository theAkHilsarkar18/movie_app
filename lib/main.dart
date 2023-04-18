import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screen/gmap/view/mapscreen.dart';
import 'package:movie_app/screen/home/provider/homeprovider.dart';
import 'package:movie_app/screen/home/view/homescreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
          'map' : (context) => MapSample(),
        },
      ),
    ),
  );
}