import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/theme/app_theme.dart';
import 'package:productos_app/widgets/get_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 40),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product.picture),
            _ProductDetails(
              name: product.name,
              id: product.id,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: _PriceTag(
                price: product.price,
              ),
            ),
            if (!product.available)
              const Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 7),
          blurRadius: 10,
        ),
      ],
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Not available',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      height: 60,
      decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          )),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$price',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
    required this.name,
    this.id,
  }) : super(key: key);

  final String name;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'ID: $id',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage(this.url);
  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: getImage(url),
      ),
    );
  }
}
