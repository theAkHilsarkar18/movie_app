import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/apihelper.dart';
import '../model/homemodel.dart';

class Homeprovider extends ChangeNotifier
{
  double longitude = 0.0;
  double latitude = 0.0;


  String movieName = "pathan";
  Future<Homemodel> movieApiCalling(String name)
  async {
    Homemodel? homemodel = await Apihelper().getMovieAPI(name);
    return homemodel;
  }

  void changeName(String name)
  {
    movieName = name;
    notifyListeners();
  }
}