import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/add_new_product_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD App"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
    
  }
}
