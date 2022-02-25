import 'dart:convert';

import 'package:trii/app/app_constants.dart';

import 'package:http/http.dart' as http;


class API {
  API();

  static const BASEAPIURL = 'rickandmortyapi.com';



  String uidUser = "";




  static const String GET_POSTS = "/api/character/";



 Future<MyHttpResponse> getUser2() async {
    var url = Uri.parse("https://"+BASEAPIURL+ GET_POSTS);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
   try {
     if (response.statusCode == 200) {
       response.message = "exito";

     } else {
       response.message = "Error";
       response.data = null;
     }
   }catch(e){
     response.message = e.toString();
     response.data = null;
   }
    return response;
  }









}

Future<MyHttpResponse> getRequest(Uri uri) async {
  var response = await http.get(uri);

  print(response.body);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
