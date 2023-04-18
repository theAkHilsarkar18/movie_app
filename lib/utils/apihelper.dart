
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/screen/home/model/homemodel.dart';
import 'package:movie_app/screen/home/view/homescreen.dart';

class Apihelper
{
  Future<Homemodel> getMovieAPI(String name)
  async {
    String link = "https://imdb8.p.rapidapi.com/auto-complete?q=$name";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri,headers: {"X-RapidAPI-Key":"10fae5a147msh1e76b2f84d872e6p1c20a8jsne51a7b9bfa20","X-RapidAPI-Host":"imdb8.p.rapidapi.com"});
    var json = jsonDecode(response.body);
    Homemodel homemodel = Homemodel.fromJson(json);
  return homemodel;
  }
}
