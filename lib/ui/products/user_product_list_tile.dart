import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'products_manager.dart';
import 'package:provider/provider.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;

  const UserProductListTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          buildEditButton(context),
          buildDeleteButton(context),
        ]),
      ),
    );
  }

  // Widget buildDeleteButton(BuildContext context) {
  //   return IconButton(
  //     icon: const Icon(Icons.delete),
  //     onPressed: () async {
  //       // ignore: avoid_print
  //       print('Delete a product');
  //     },
  //     color: Theme.of(context).errorColor,
  //   );
  // }
  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Product deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        // ignore: avoid_print
        print('Go to edit product sreen');
      },
      icon: const Icon(Icons.edit),
      color: Theme.of(context).primaryColor,
    );
  }
}