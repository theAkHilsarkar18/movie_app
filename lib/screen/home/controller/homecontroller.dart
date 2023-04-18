import 'package:get/get.dart';
import 'package:movie_app/utils/apihelper.dart';

import '../model/homemodel.dart';

class HomeController extends GetxController
{

  Future<Homemodel> movieApiCalling(String name)
  async {
    Homemodel? homemodel = await Apihelper().getMovieAPI(name);
    return homemodel;
  }

  RxString movieName = "game of throne".obs;
  void changeName(RxString name)
  {
    movieName = name;
  }

}