import 'package:flutter_breaking/constants/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
   late Dio dio ;
  CharacterWebServices(){
    BaseOptions _baseOptions = BaseOptions(
    baseUrl:baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: Duration(seconds: 20), // 20 seconds
    receiveTimeout: Duration(seconds: 20), // 20 seconds
  );
  dio = Dio(_baseOptions);
  }
  Future <List<dynamic>> getCharacters() async{
    try{
      Response response = await dio.get("character");
      // return response.data["results"];
      print(response.data.toString());
      return response.data;
    }
    catch(e){
      print(e.toString());
      return [];
    }
  }
  
}
