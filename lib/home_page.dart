import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/add_new_product_screen.dart';
import 'package:flutter_crud_app_with_api/update_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void myAlertDialog(BuildContext context){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
      ),
      body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context,index){
            return ListTile(
              onLongPress: (){
                myAlertDialog(context);
              },
              leading: Image.network(
                "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcGYtczczLXRlZC0xMDIyMi5wbmc.png?s=eHiWXY9rDBJrjWGsCN6pJXrj7i3JjX6BTbJfi-vEngY",
                width: 50,
                errorBuilder:(BuildContext, Object, StackTrace){
                  return const Icon(Icons.image);
                },),
              title: const Text("Product name"),
              subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code"),
                  Text("Total Price"),
                  Text("Available Units"),
                ],
              ),
              trailing: const Text("Unit price"),

            );
          },
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
          height: 8.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
    
  }
}
