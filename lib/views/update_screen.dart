import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

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

                          }
                        },
                        child: Text("Update Product",style: TextStyle(fontSize: _size.height*0.023),)),
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
