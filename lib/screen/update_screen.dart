import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/models/Products_model.dart';
import 'package:http/http.dart';

class UpdateScreen extends StatefulWidget {
  final ProductsModel products;
  const UpdateScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    _productNameController.text = widget.products.productName ?? '';
    _productCodeController.text = widget.products.productCode ?? '';
    _unitPriceController.text = widget.products.quantity ?? '';
    _quantityController.text = widget.products.quantity ?? '';
    _totalPriceController.text = widget.products.totalPrice ?? '';
    _imageController.text = widget.products.image ?? '';
    super.initState();
  }

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  bool isProgress = false;

  Future<void> updateProduct()async {
    isProgress = true;
    setState(() {});

    final Map<String,dynamic> requestBody ={
      "Img":_imageController.text.trim(),
      "ProductCode":_productCodeController.text.trim(),
      "ProductName":_productNameController.text.trim(),
      "Qty":_quantityController.text.trim(),
      "TotalPrice":_totalPriceController.text.trim(),
      "UnitPrice":_unitPriceController.text.trim()
    };

    Response response = await post(
        Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.products.id}"),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(requestBody)
    );

    isProgress = false;
    setState(() {});

    log("=====>${response.statusCode}");

    if(response.statusCode ==200){
      final Map<String,dynamic> decodedResponseBody = jsonDecode(response.body);
      log("***********=>$decodedResponseBody");
      if(decodedResponseBody['status'] == 'success'){
        _productNameController.clear();
        _productCodeController.clear();
        _unitPriceController.clear();
        _quantityController.clear();
        _totalPriceController.clear();
        _imageController.clear();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Update successful!!"),
            ),
          );
        }
      }else{
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Update Failed"),
            ),
          );
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Screen"),
      ),
      body: SizedBox(
        height: _size.height*0.99,
        width: _size.width*93,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(_size.height*.02),
            child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _productNameController,
                    decoration: const InputDecoration(
                      hintText: "Product Name",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Product Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.01),
                  TextFormField(
                    controller: _productCodeController,
                    decoration: const InputDecoration(
                      hintText: "Product Code",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Product Code";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.01),
                  TextFormField(
                    controller: _unitPriceController,
                    decoration: const InputDecoration(
                      hintText: "Unit Price",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Unit Price";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.01),
                  TextFormField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      hintText: "Quantity",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Quantity";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.01),
                  TextFormField(
                    controller: _totalPriceController,
                    decoration: const InputDecoration(
                      hintText: "Total Price",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Total Price";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.01),
                  TextFormField(
                    controller: _imageController,
                    decoration: const InputDecoration(
                      hintText: "Image",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter Image";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: _size.height*.02),
                  SizedBox(
                    height: _size.height*0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if(_fromkey.currentState!.validate()){
                            updateProduct();
                          }
                        },
                        child:isProgress ? const Center(child: CupertinoActivityIndicator(radius: 15,color: Colors.white,)) : Text("Update Product",style: TextStyle(fontSize: _size.height*0.023),)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
