import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-10704-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  Product? selectProduct;

  final storage = const FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json', {
      'auth': await storage.read(key: 'token') ?? '',
    });
    final res = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(res.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json', {
      'auth': await storage.read(key: 'token') ?? '',
    });
    final res = await http.put(url, body: product.toJson());
    final decodedData = res.body;

    products[products.indexWhere((element) => element.id == product.id)] =
        product;

    SnackbarToast.showSnackBar('The product was updated');

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json', {
      'auth': await storage.read(key: 'token') ?? '',
    });
    final res = await http.post(url, body: product.toJson());
    final decodedData = json.decode(res.body);

    print(decodedData);

    product.id = decodedData['name'];
    products.add(product);

    SnackbarToast.showSnackBar('The product was created');

    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectProduct!.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dgna2mogt/image/upload?upload_preset=flutter_udemy_sesion13');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(response.body);
    return decodedData['secure_url'];
  }
}
