import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:leleabtask/emplist/model/empresmodel.dart';

class Repository {

  static Future<List<EmpResModel>> getEmpList()async{
    try {
      var result =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      return (json.decode(result.body) as List).map((i) => EmpResModel.fromJson(i)).toList();
    } catch (e) {
      print(e);
      if(e is SocketException){
        throw "No Internet";
      }
      else {
        throw "Server Error";
      }
    }
  }


}