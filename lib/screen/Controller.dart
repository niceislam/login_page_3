

import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart'as http;
import 'package:login_page_3/screen/Api_url.dart';

class DataController{
  static Future<bool> niceData({required String mail, required String password}) async{
    try{
      Uri url = Uri.parse(APIurl.loginurl);
      var body = {"email_phone": "$mail",
      "password": "$password"};
      var h = {"Accept": "application/json",
      "Content-Type": "application/json"};
      var response = await http.post(url, body: jsonEncode(body), headers: h);
      log("===========${response.statusCode}");

      if(response.statusCode == 200){
        EasyLoading.showSuccess("login successful");
        return true;
      }else{
        EasyLoading.showError("wrong user");
        return false;
      }


    }catch (e) {log("=========$e");}
    EasyLoading.dismiss();
    return false;
    
  }
}