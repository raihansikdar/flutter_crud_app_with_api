import 'package:flutter_crud_app_with_api/network/network_component/api_urls.dart';
import 'package:flutter_crud_app_with_api/network/service/network_caller.dart';
import 'package:flutter_crud_app_with_api/network/service/network_response.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> addProduct(
      {required String productName,
      required String productCode,
      required String unitePrice,
      required String quantity,
      required String totalPrice,
      required String image}) async {

    _isLoading = true;
    update();

    Map<String, dynamic> requestBody = {
      "Img":image,
      "ProductCode":productCode,
      "ProductName":productName,
      "Qty":quantity,
      "TotalPrice":totalPrice,
      "UnitPrice":unitePrice
    };

    NetworkResponse response = await NetworkCaller().postRequest(Urls.createProductEndPoint, requestBody);

    _isLoading = false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }

  }
}
