import 'dart:convert';
import 'dart:developer';

import 'package:flutter_crud_app_with_api/models/product_model.dart';
import 'package:flutter_crud_app_with_api/network/network_component/api_urls.dart';
import 'package:flutter_crud_app_with_api/network/service/network_caller.dart';
import 'package:flutter_crud_app_with_api/network/service/network_response.dart';
import 'package:get/get.dart';

class DeleteProductController extends GetxController{

  Future<bool> deleteRequest({required String productId}) async {

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.deleteProductEndPoint(id:productId));

    log(" delete : ${response.statusCode}");
    if(response.isSuccess && response.statusCode == 200) {

      return true;
    }else{
      return false;
    }
  }
}