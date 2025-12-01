import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Your Cart")),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
            ),
            title: Text(cartItem['title'].toString(), style: Theme.of(context).textTheme.bodySmall,),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Size : ${cartItem['size'].toString()}"),
                Text("Rs. ${cartItem['price'].toString()}", style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            trailing: IconButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("Delete Product", style: Theme.of(context).textTheme.titleMedium,),
                  content: Text("Are you sure you want to remove ${cartItem['title'].toString()} from the cart?"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: const Text("No", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),), ),
                    TextButton(onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItem);
                      Navigator.of(context).pop();
                    }, child: const Text("Yes", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),

                  ],
                );
              });
            }, icon: Icon(Icons.delete, color: Colors.red,)),
          );
        },
      ),
    );
  }
}
