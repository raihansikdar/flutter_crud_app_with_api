import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product Screen"),
      ),
      body: Container(
        height: _size.height*0.99,
        width: _size.width*93,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(_size.height*.02),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                  ),
                ),
                SizedBox(height: _size.height*.01),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Product Code",
                  ),
                ),
                SizedBox(height: _size.height*.01),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Unit Price",
                  ),
                ),
                SizedBox(height: _size.height*.01),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Quantity",
                  ),
                ),
                SizedBox(height: _size.height*.01),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Total Price",
                  ),
                ),
                SizedBox(height: _size.height*.01),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Image",
                  ),
                ),
                SizedBox(height: _size.height*.02),
                SizedBox(
                  height: _size.height*0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Add Product",style: TextStyle(fontSize: _size.height*0.023),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
