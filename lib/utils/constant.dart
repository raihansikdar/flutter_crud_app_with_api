import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/screen/update_screen.dart';

class ConstantUtils {
  ConstantUtils._();
 static void myAlertDialog(BuildContext context){
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const UpdateScreen()));

              },
              leading: const Icon(Icons.edit),
              title: const Text("Edit"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: (){
                Navigator.pop(context);
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