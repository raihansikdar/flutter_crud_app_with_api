import 'package:flutter_crud_app_with_api/view_model/add_product_controller.dart';
import 'package:flutter_crud_app_with_api/view_model/delete_product_controller.dart';
import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';
import 'package:flutter_crud_app_with_api/view_model/update_product_controller.dart';
import 'package:get/get.dart';

class ControllerBindling extends Bindings{

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<UpdateProductController>(UpdateProductController());
    Get.put<AddProductController>(AddProductController());
    Get.put<DeleteProductController>(DeleteProductController());
  }

}