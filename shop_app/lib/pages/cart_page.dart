import 'package:flutter/material.dart';
import 'package:shop_app/pages/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red,)),
          );
        },
      ),
    );
  }
}
