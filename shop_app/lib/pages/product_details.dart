import 'package:flutter/material.dart';
import 'package:shop_app/pages/global_variables.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Product Details")),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'].toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Image.asset(
            widget.product['imageUrl'].toString(),
            //height: 400,
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text(
                      "Rs. ${widget.product['price'].toString()}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                 ),
                //const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                            color: WidgetStatePropertyAll((selectedSize == size) ? Theme.of(context).colorScheme.primary : Colors.white),
                            
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
                    ),
                    label: Text("Add to cart", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    icon: Icon(Icons.shopping_cart, color: Colors.black,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
