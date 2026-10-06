import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['products'];
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Ürünler yüklenemedi. Status code: ${response.statusCode}');
    }
  }
}