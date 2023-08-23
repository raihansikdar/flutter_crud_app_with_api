class Urls{
  Urls._();
  static const String _baseUrl = "https://crud.teamrabbil.com";
  static String readProductEndPoint = "$_baseUrl/api/v1/ReadProduct";
  static String createProductEndPoint = "$_baseUrl/api/v1/CreateProduct";
  static String deleteProductEndPoint({required String id}) => "$_baseUrl/api/v1/DeleteProduct/$id";
  static String updateProductEndPoint({required String id}) => "$_baseUrl/api/v1/UpdateProduct/$id";
}