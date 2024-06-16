// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace
//cart_item_card.dart file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/item.dart';

class CartItemCard extends StatefulWidget {
  final Item item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 248, 241, 239),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Container(
              width: 70,
              height: 300,
              child: Image.asset(
                widget.item.imagePath,
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Size: ${widget.item.selectedSize}',
                  style: TextStyle(color: Colors.brown[900]),
                ),
                SizedBox(height: 6),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${widget.item.price}',
                  style: TextStyle(
                    color: Colors.brown[900],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          widget.item.selectedQuantity--;
                        });
                      },
                    ),
                    Text(
                      '${widget.item.selectedQuantity}',
                      style: TextStyle(fontSize: 16, color: Colors.brown[900]),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            widget.item.selectedQuantity++;
                          });
                        }),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.brown[900],
              onPressed: () {
                Provider.of<Cart>(context, listen: false)
                    .removeItemFromCart(widget.item);
              },
            ),
          ),
        ),
      ),
    );
  }
}
