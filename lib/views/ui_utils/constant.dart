import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/models/product_model.dart';
import 'package:flutter_crud_app_with_api/view_model/delete_product_controller.dart';
import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';
import 'package:flutter_crud_app_with_api/views/update_screen.dart';
import 'package:get/get.dart';

final DeleteProductController _deleteProductController =Get.put(DeleteProductController());
final HomeController _homeController = Get.put(HomeController());
class ConstantUtils {
  ConstantUtils._();
 static void myAlertDialog(BuildContext context, {required String productId,required Data? productIndex}){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(left: 16.0),
        contentPadding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
        title: Row(
          children: [
            const Text("Choose an action"),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                Navigator.pop(context);
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  UpdateScreen(products: productIndex,),
                      ),
                    );
                  },
              leading: const Icon(Icons.edit),
              title: const Text("Edit"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                _deleteProductController.deleteRequest(productId: productId).then((value) {
                  if(value == true){
                    _homeController.getRequest();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Delete successful!!"),
                      ),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Delete failed!!"),
                      ),
                    );
                  }
                });
              },
              leading: const Icon(Icons.delete),
              title: const Text("Delete"),
            ),
          ],
        ),
      );

    });
  }
}