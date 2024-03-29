import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/providers/providers.dart';

import 'package:productos_app/theme/app_theme.dart';
import 'package:productos_app/ui/input_decorations.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectProduct),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(url: productService.selectProduct?.picture),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios,
                          size: 40, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      onPressed: () async {
                        //TODO: CAMERA OR GALLERY
                        final picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 100,
                        );

                        if (pickedFile == null) {
                          return;
                        }

                        productService
                            .updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.camera_alt_outlined,
                          size: 40, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const _ProductForm(),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: productService.isSaving
              ? null
              : () async {
                  if (!productForm.isValidForm()) return;

                  final String? imageUrl = await productService.uploadImage();

                  if (imageUrl != null) productForm.product!.picture = imageUrl;

                  await productService
                      .saveOrCreateProduct(productForm.product!);
                },
          child: productService.isSaving
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : const Icon(Icons.save_outlined),
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                initialValue: product!.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name product is obligatory';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product name',
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}'),
                  ),
                ],
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150.00',
                  labelText: 'Price',
                ),
              ),
              const SizedBox(height: 30),
              SwitchListTile.adaptive(
                value: product.available,
                title: const Text('Available'),
                activeColor: AppTheme.primaryColor,
                onChanged: productForm.updateAvailability,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5),
      ],
    );
  }
}
