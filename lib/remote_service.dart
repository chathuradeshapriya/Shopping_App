import 'package:http/http.dart' as http;
import 'package:shop_app/product.dart';
import 'package:shop_app/product_controller.dart';

class RemoteServices{

  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    // var response = await client.get('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');

    var response = await client.get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200){

      var jsonString = response.body;
      return productFromJson(jsonString);
    }
    else {
      return null;
    }
  }

}