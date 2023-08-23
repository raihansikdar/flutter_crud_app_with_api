import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/models/product_model.dart';
import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';
import 'package:flutter_crud_app_with_api/view_model/update_product_controller.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatefulWidget {
  final Data? products;
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
    _productNameController.text = widget.products?.productName ?? '';
    _productCodeController.text = widget.products?.productCode ?? '';
    _unitPriceController.text = widget.products?.unitPrice ?? '';
    _quantityController.text = widget.products?.qty ?? '';
    _totalPriceController.text = widget.products?.totalPrice ?? '';
    _imageController.text = widget.products?.img ?? '';
    super.initState();
  }
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  final UpdateProductController _updateProductController = Get.put(UpdateProductController());

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
                    child: GetBuilder<UpdateProductController>(builder: (_) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              _updateProductController.updateProduct(
                                  productName: _productNameController.text,
                                  productCode: _productCodeController.text,
                                  unitePrice: _unitPriceController.text,
                                  quantity: _quantityController.text,
                                  totalPrice: _totalPriceController.text,
                                  image: _imageController.text,
                                  productId: widget.products?.sId ?? '').then((
                                  value) {
                                if (value == true) {
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
                                }
                              });
                            }
                          },
                          child:_updateProductController.isLoading ? const Center(child: CupertinoActivityIndicator(radius: 15,color: Colors.white)) : Text("Update Product",
                            style: TextStyle(fontSize: _size.height * 0.023),));
                    }),
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
