// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iti/constants/colors.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/controllers/controllerProvider.dart';
import 'package:iti/models/product.dart';
import 'package:iti/screens/widgets/customTextField.dart';
import 'package:iti/screens/widgets/itemProduct.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductsPage extends StatelessWidget {
  ProductsPage({
    super.key,
    required this.category,
  });
  String category;
  List<Product> allProducts = [];
  List<Product> allProductsFiltering = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var watch = context.watch<controller>();
    var read = context.read<controller>();
    //filering
    List<Product> prods =
        watch.isSearching ? watch.allProductsFiltering : watch.products;
    allProducts = category.isEmpty
        ? prods
        : prods.where((element) => element.category == category).toList();
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //products title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Row(
                children: [
                  category.isEmpty
                      ? Container()
                      : IconButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed(homePageRoute),
                          icon: const Icon(Icons.arrow_back),
                        ),
                  Text(
                    category.isEmpty ? 'Products' : category,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            //search field
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 10, right: 10),
              child: customTextField(
                hint: 'Search',
                OnChanged: (value) => read.seachField(value),
                color: white,
              ),
            ),
            SizedBox(height: height * .02),
            //products
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return itemProduct(
                      product: allProducts[index],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3.2 / 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
