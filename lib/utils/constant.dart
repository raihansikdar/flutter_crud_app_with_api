import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/models/Products_model.dart';
import 'package:flutter_crud_app_with_api/screen/update_screen.dart';

class ConstantUtils {
  ConstantUtils._();
  static void myAlertDialog(BuildContext context, int index, Function deleteCallback,List<ProductsModel> products){
    /*
      1. int index: This parameter holds the index of the selected "ListTile". It's used to determine which product's data should be
           processed in the dialog.
      2. Function deleteCallback: This is a reference to the deleteRequest function that's passed from the HomePage class. It's used
          to trigger the deletion process when the user selects the "Delete" option in the dialog.
      3. List<ProductsModel> products: This parameter is a list of product objects. It's used to access the necessary data of the
        selected product, like its ID.
    */
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
                        builder: (context) => UpdateScreen(
                          products: products[index], // full index dhore niye jaschi
                        ),
                      ),
                    );
                  },
              leading: const Icon(Icons.edit),
              title: const Text("Edit"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: ()async{
                Navigator.pop(context); // Close the dialog
                // Get the product's ID
                String? productId = products[index].id; // Replace 'id' with the actual property name
                 print(productId);
                // Call the deleteRequest function passed as a parameter
                await deleteCallback(id: productId);
                //await deleteRequest(id: productId); same jinish
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