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

// ----------------------- Get api call here---------------------------------

  Future<void> getRequest() async{
    isLoading = true;
    setState(() {});

   final Response response = await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    isLoading = false;
    setState(() {});

    // log(response.statusCode.toString());
    // log(response.body);

   final Map<String,dynamic> decodedResponse = jsonDecode(response.body);

    // log(decodedResponse.length.toString());
    // log(decodedResponse['data'].length.toString());

    if(response.statusCode == 200 && decodedResponse['status'] == 'success'){
      products.clear();
      for (var jsonData in decodedResponse['data']){
        products.add(ProductsModel.toJson(jsonData));
      }
    }

  }
  // ----------------------- Get api call here---------------------------------

  Future<void> deleteRequest({required String id}) async{
    Response response = await get(Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id"));

    log(" delete : ${response.statusCode}");
    final Map<String,dynamic> decodedResponse = jsonDecode(response.body);

    if(response.statusCode == 200 && decodedResponse['status'] == 'success'){
      getRequest();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Delete successful!!"),
          ),
        );
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
        actions: [
          IconButton(onPressed: (){
            getRequest();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ListTile(
              onLongPress: (){
              //  ConstantUtils.myAlertDialog(context);
                ConstantUtils.myAlertDialog(context, index, deleteRequest, products);
                /*
                1. index: This is the index of the selected "ListTile" in your "ListView". It's used to identify which product's data
                 should be processed in the dialog.

                2. deleteRequest: This is a reference to the "deleteRequest function" defined in your HomePage class. It's passed to the
                 dialog so that when the user selects the "Delete" option, the dialog can call this function to perform the deletion.

                3. products: This is a list of "ProductsModel objects" containing your product data. It's needed so that the dialog can access
                 the data of the selected product (like its ID) to perform the required action.
                 */
              },
              leading: Image.network(
                products[index].image ?? '',
                width: 50,
                errorBuilder:(_, __, ___){
                  return const Icon(Icons.image);
                },),
              title:  Text(products[index].productName ?? ''),
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
                  builder: (context) =>  const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );

  }
}
