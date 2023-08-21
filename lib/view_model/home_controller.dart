import 'dart:developer';

import 'package:flutter_crud_app_with_api/models/product_model.dart';
import 'package:flutter_crud_app_with_api/network/network_component/api_urls.dart';
import 'package:flutter_crud_app_with_api/network/service/network_caller.dart';
import 'package:flutter_crud_app_with_api/network/service/network_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
ProductModel _productModel = ProductModel();
bool _isLoading = false;

ProductModel get productModel => _productModel;
bool get isLoading => _isLoading;

Future<bool> getRequest()async{
   _isLoading = true;
   update();

   final NetworkResponse response = await NetworkCaller().getRequest(Urls.readProductEndPoint);

   _isLoading = false;
   if(response.isSuccess){
     _productModel = ProductModel.fromJson(response.body!);
     update();
     return true;
   }else{
     return false;
   }
}


}