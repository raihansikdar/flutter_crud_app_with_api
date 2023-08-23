import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';

import 'package:flutter_crud_app_with_api/views/add_new_product_screen.dart';
import 'package:flutter_crud_app_with_api/views/ui_utils/constant.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());

   @override
   void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       _homeController.getRequest();
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
        actions: [
          IconButton(onPressed: (){
            _homeController.getRequest();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (_){
          return _homeController.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.separated(
            itemCount: _homeController.productModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  ConstantUtils.myAlertDialog(context,productId: _homeController.productModel.data?[index].sId ?? '');
                },
                leading: Image.network(
                  _homeController.productModel.data?[index].img ?? '',
                  width: 50,
                  errorBuilder: (_, __, ___) {
                    return const Icon(Icons.image);
                  },),
                title: Text(_homeController.productModel.data?[index].productName ?? ''),
                subtitle:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Code : ${_homeController.productModel.data?[index].productCode ?? ''} "),
                    Text("Total Price : ${_homeController.productModel.data?[index].totalPrice ?? ''}"),
                    Text("Available Units : ${_homeController.productModel.data?[index].qty ?? ''}"),
                  ],
                ),
                trailing:  Text(_homeController.productModel.data?[index].unitPrice ?? ''),

              );
            },
            separatorBuilder: (context, index) =>
            const Divider(
              thickness: 2,
              height: 8.0,
            ),
          );
        },
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
