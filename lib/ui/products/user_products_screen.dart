import 'package:flutter/material.dart';

import 'user_product_list_tile.dart';
import 'products_manager.dart';
import '../shared/app_drawer.dart';
import 'edit_product_screen.dart';

import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Product'),
          actions: <Widget>[
            buildAddButton(context),
          ],
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: buildUserProductListView(productsManager),
            );
          },
        ));
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(builder: (ctx, productsManager, child) {
      return ListView.builder(
        itemCount: productsManager.itemCount,
        itemBuilder: (ctx, i) => Column(
          children: [
            UserProductListTile(
              productsManager.items[i],
            ),
            const Divider(),
          ],
        ),
      );
    });
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}