import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/models/Products_model.dart';
import 'package:flutter_crud_app_with_api/screen/add_new_product_screen.dart';
import 'package:flutter_crud_app_with_api/utils/constant.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductsModel> products = [];

  bool isLoading = false;

  Future<void> getRequest() async{
    isLoading = true;
    setState(() {});

   final Response response = await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    isLoading = false;
    setState(() {});

  final Map<String,dynamic> decodedResponse = jsonDecode(response.body);

   log(decodedResponse.length.toString());
   log(decodedResponse['data'].length.toString());

    if(response.statusCode == 200 ){
      log(response.statusCode.toString());
      log(response.body);

      for (var jsonData in decodedResponse['data']){
        products.add(ProductsModel.toJson(jsonData));
      }
    }

  }

  @override
  void initState() {
    super.initState();
    log("api call");
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ListTile(
              onLongPress: (){
                ConstantUtils.myAlertDialog(context);
              },
              leading: Image.network(
                products[index].image,
                width: 50,
                errorBuilder:(_, __, ___){
                  return const Icon(Icons.image);
                },),
              title:  Text(products[index].productName),
              subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code : ${products[index].productCode}"),
                  Text("Total Price : ${products[index].totalPrice}"),
                  Text("Available Units : ${products[index].quantity}"),
                ],
              ),
              trailing: Text("Unit price : ${products[index].unitPrice}"),

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
