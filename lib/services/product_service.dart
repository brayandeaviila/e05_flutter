import 'dart:convert';

import 'package:e05_flutter/models/category.dart';
import 'package:e05_flutter/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com';
  
  Future<List<Product>> getProducts({int limit=10}) async{

  final url =Uri.parse("$_baseUrl/products?limit=$limit");

 final response = await http.get(url);
  
  if(response.statusCode != 200){
    throw Exception('Error consultando Productos Error ${response.statusCode}');
  }
  
  final Map<String, dynamic> data = json.decode(response.body);

  final List<dynamic> jsonList = data['products'];

  return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Category>> getCategories() async {

    final url = Uri.parse("$_baseUrl/products/categories");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error consultando Productos Error: ${response.statusCode}');
    }

    final List<dynamic> jsonList = json.decode(response.body);

    return jsonList.map((json) => Category.fromJson(json)).toList();
  }

  Future<Product> getProductById(int id) async {
    final url = Uri.parse("$_baseUrl/products/$id");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error consultando el Producto Error: ${response.statusCode}');
    }

    return Product.fromJson(jsonDecode(response.body));
  }


  Future<List<Product>> getProductsByCategory(String category) async {

    final url = Uri.parse("$_baseUrl/products/category/$category");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error consultando las categorias Error: ${response.statusCode}');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    
    final List<dynamic> jsonList = data['products'];

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }


}