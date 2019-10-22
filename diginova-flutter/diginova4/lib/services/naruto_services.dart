import 'package:diginova4/model/naruto_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NarutoServices{

  static Future<List<NarutoModel>>fetchData() async{
    String url = "https://api.jikan.moe/v3/search/anime?q=naruto&limit=16";
    var response = await http.get(url, headers: {
      "Accept" : "application/json"
    },);
    List<NarutoModel> narutoList;
    if(response.statusCode == 200){
      narutoList = List<NarutoModel>();

      var data = json.decode(response.body);
      for (int i = 0; i < data["results"].length; i++) {
        narutoList.add(
          NarutoModel.fromJson(data["results"][i])
        );
      }

    }
    return narutoList;
  }
}