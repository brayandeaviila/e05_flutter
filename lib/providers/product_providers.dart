
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e05_flutter/models/product.dart';
import 'package:e05_flutter/models/category.dart';
import 'package:e05_flutter/services/product_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) {

  final service = ref.watch(productServiceProvider);

  return service.getCategories();
});

class CategoriaSeleccionada extends Notifier<String?>{


  @override
  String? build() {return null;}

  void seleccionar(String? slug){
    state = (state==slug) ? null : slug;
  }

}

final categoriesSeleccionadaProvider = NotifierProvider<CategoriaSeleccionada, String?>(CategoriaSeleccionada.new);

final productProvider = FutureProvider<List<Product>>((ref) {
  final service = ref.watch(productServiceProvider);
  final slug = ref.watch(categoriesSeleccionadaProvider);

  return slug == null ? service.getProducts() : service.getProductsByCategory(slug);
});

final productByIdProvider = FutureProvider.family<Product, int>((ref, id) {
  final service = ref.watch(productServiceProvider);
  return service.getProductById(id);
});