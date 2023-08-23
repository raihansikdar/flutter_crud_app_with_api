import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/view_model/add_product_controller.dart';
import 'package:get/get.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  AddProductController _addProductController = Get.put(AddProductController());

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product Screen"),
      ),
      body: SizedBox(
        height: _size.height * 0.99,
        width: _size.width * 93,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(_size.height * .02),
            child: Form(
                key: _fromkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _productNameController,
                      decoration: const InputDecoration(
                        hintText: "Product Name",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Product Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .01),
                    TextFormField(
                      controller: _productCodeController,
                      decoration: const InputDecoration(
                        hintText: "Product Code",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Product Code";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .01),
                    TextFormField(
                      controller: _unitPriceController,
                      decoration: const InputDecoration(
                        hintText: "Unit Price",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Unit Price";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .01),
                    TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        hintText: "Quantity",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Quantity";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .01),
                    TextFormField(
                      controller: _totalPriceController,
                      decoration: const InputDecoration(
                        hintText: "Total Price",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Total Price";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .01),
                    TextFormField(
                      controller: _imageController,
                      decoration: const InputDecoration(
                        hintText: "Image",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Please Enter Image";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: _size.height * .02),
                    SizedBox(
                        height: _size.height * 0.06,
                        width: double.infinity,
                        child: GetBuilder<AddProductController>(builder: (_) {
                          return ElevatedButton(
                              onPressed: () {
                                if (_fromkey.currentState!.validate()) {
                                  _addProductController.addProduct(
                                    productName: _productNameController.text.trim(),
                                    productCode: _productCodeController.text.trim(),
                                    unitePrice: _unitPriceController.text.trim(),
                                    quantity: _quantityController.text.trim(),
                                    totalPrice: _quantityController.text.trim(),
                                    image: _imageController.text.trim(),
                                  )
                                      .then((value) {
                                    if (value == true) {
                                      _productNameController.clear();
                                      _productCodeController.clear();
                                      _unitPriceController.clear();
                                      _quantityController.clear();
                                      _totalPriceController.clear();
                                      _imageController.clear();
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "New data Add successful!!"),
                                          ),
                                        );
                                      }
                                    } else {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("New Product add Failed"),
                                          ),
                                        );
                                      }
                                    }
                                  });
                                }
                              },
                              child: _addProductController.isLoading ? const Center(child: CupertinoActivityIndicator(radius: 15,color: Colors.white,)): Text(
                                "Add Product",
                                style:
                                    TextStyle(fontSize: _size.height * 0.023),
                              ));
                        }))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
