class ProductsModel {
  final String? id, productName, productCode, image, unitPrice, quantity,
      totalPrice, createdAt;

  ProductsModel(this.id, this.productName, this.productCode, this.image, this.unitPrice, this.quantity, this.totalPrice, this.createdAt);


  factory ProductsModel.toJson(Map<String,dynamic> jsonData){
    return ProductsModel(
      jsonData['_id'],
      jsonData['ProductName'],
      jsonData['ProductCode'],
      jsonData['Img'],
      jsonData['UnitPrice'],
      jsonData['Qty'],
      jsonData['TotalPrice'],
      jsonData['CreatedDate'],
    );
  }
}