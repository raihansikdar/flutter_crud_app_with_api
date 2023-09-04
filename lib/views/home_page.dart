// import 'package:flutter/material.dart';
// import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';
//
// import 'package:flutter_crud_app_with_api/views/add_new_product_screen.dart';
// import 'package:flutter_crud_app_with_api/views/ui_utils/constant.dart';
// import 'package:get/get.dart';
//
//
// class HomePage extends StatefulWidget {
//    const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final HomeController _homeController = Get.find<HomeController>();
//
//    @override
//    void initState() {
//      super.initState();
//      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//        _homeController.getRequest();
//      });
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("CRUD App"),
//         actions: [
//           IconButton(onPressed: (){
//             _homeController.getRequest();
//           }, icon: const Icon(Icons.refresh))
//         ],
//       ),
//       body: GetBuilder<HomeController>(
//         builder: (_){
//           return _homeController.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.separated(
//             itemCount: _homeController.productModel.data?.length ?? 0,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 onLongPress: () {
//                         ConstantUtils.myAlertDialog(context,
//                             productId: _homeController.productModel.data?[index].sId ?? '',
//                             productIndex: _homeController.productModel.data?[index],
//                         );
//
//                       },
//                 leading: Image.network(
//                   _homeController.productModel.data?[index].img ?? '',
//                   width: 50,
//                   errorBuilder: (_, __, ___) {
//                     return const Icon(Icons.image);
//                   },),
//                 title: Text(_homeController.productModel.data?[index].productName ?? ''),
//                 subtitle:  Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Product Code : ${_homeController.productModel.data?[index].productCode ?? ''} "),
//                     Text("Total Price : ${_homeController.productModel.data?[index].totalPrice ?? ''}"),
//                     Text("Available Units : ${_homeController.productModel.data?[index].qty ?? ''}"),
//                   ],
//                 ),
//                 trailing:  Text(_homeController.productModel.data?[index].unitPrice ?? ''),
//
//               );
//             },
//             separatorBuilder: (context, index) =>
//             const Divider(
//               thickness: 2,
//               height: 8.0,
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Get.to(()=>const AddNewProductScreen(),transition:sendTransition);
//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //         builder: (context) => const AddNewProductScreen()));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_app_with_api/view_model/home_controller.dart';
import 'package:flutter_crud_app_with_api/views/add_new_product_screen.dart';
import 'package:flutter_crud_app_with_api/views/ui_utils/constant.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeController.getRequest();
     // isLoader();
    });
  }
  // bool isLoading = true;
  // Future<void>isLoader() async{
  //   await Future.delayed(Duration(seconds: 10));
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
        actions: [
          IconButton(
            onPressed: () {
              _homeController.getRequest();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return _homeController.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.separated(
                    itemCount: _homeController.productModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                        ),
                        title: Container(
                          width: double.infinity,
                          height: 20,
                          color: Colors.white,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 16,
                              color: Colors.white,
                            ),
                            Container(
                              width: 100,
                              height: 16,
                              color: Colors.white,
                            ),
                            Container(
                              width: 120,
                              height: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 50,
                          height: 20,
                          color: Colors.white,
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const Divider(
                        thickness: 2,
                        height: 8.0,
                      );
                    },
                  ),
                )
              : ListView.separated(
                  itemCount: _homeController.productModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () {
                        ConstantUtils.myAlertDialog(
                          context,
                          productId: _homeController.productModel.data?[index].sId ?? '',
                          productIndex: _homeController.productModel.data?[index],
                        );
                      },

                      leading: Image.network(
                        _homeController.productModel.data?[index].img ?? '',
                        width: 50,
                        errorBuilder: (_, __, ___) {
                          return const Icon(Icons.image);
                        },
                      ),
                      title: Text(_homeController
                              .productModel.data?[index].productName ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Code : ${_homeController.productModel.data?[index].productCode ?? ''}",
                          ),
                          Text(
                            "Total Price : ${_homeController.productModel.data?[index].totalPrice ?? ''}",
                          ),
                          Text(
                            "Available Units : ${_homeController.productModel.data?[index].qty ?? ''}",
                          ),
                        ],
                      ),
                      trailing: Text(
                          _homeController.productModel.data?[index].unitPrice ??
                              ''),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 2,
                    height: 8.0,
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNewProductScreen(), transition: sendTransition);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
