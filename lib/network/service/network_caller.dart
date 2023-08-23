import 'dart:convert';
import 'dart:developer';

import 'package:flutter_crud_app_with_api/models/product_model.dart';
import 'package:flutter_crud_app_with_api/network/service/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller{
  Future<NetworkResponse> getRequest(String url)async {
    try{
      Response response = await get(Uri.parse(url));
      log("getRequest : ${response.statusCode}");
      log("getRequest : ${response.body}");
      if(response.statusCode == 200) {
          return NetworkResponse(isSuccess: true, statusCode: response.statusCode,body: jsonDecode(response.body));
        } else {
          return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
        }
      }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body)async {
    try{
      Response response = await post(Uri.parse(url),headers: {'Content-type': 'application/json'},body:jsonEncode(body));
      log("postRequest : ${response.statusCode}");
      log("postRequest : ${response.body}");
      if(response.statusCode == 200){
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, body: jsonDecode(response.body));
      }else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }
}

