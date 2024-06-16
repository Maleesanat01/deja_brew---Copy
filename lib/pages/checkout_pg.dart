// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages, sort_child_properties_last, library_private_types_in_public_api
//shop_pg.dart file
import '../models/cart.dart';
import '../models/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPg extends StatefulWidget {
  const CheckoutPg({Key? key}) : super(key: key);

  @override
  _CheckoutPgState createState() => _CheckoutPgState();
}

class _CheckoutPgState extends State<CheckoutPg> {
  @override
  Widget build(BuildContext context) {
    List<Item> userCartItems = Provider.of<Cart>(context).getUserCart();

    // Calculate total price
    double totalPrice = userCartItems.fold(0, (previousValue, item) {
      double itemPrice = double.parse(item.price);
      return previousValue + (itemPrice * item.selectedQuantity);
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: userCartItems.length,
                    itemBuilder: (context, index) {
                      Item item = userCartItems[index];
                      double itemPrice = double.parse(item.price);
                      double totalItemPrice = itemPrice * item.selectedQuantity;

                      return Container(
                        margin: EdgeInsets.only(bottom: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(item.description),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${item.selectedQuantity} x \$${item.price}'),
                                Text('\$${totalItemPrice.toStringAsFixed(2)}'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 25.0),
                      child: Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/pay_opt.png',
                width: 320,
                height: 100,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 66, 33, 21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Center(
                      child: Text(
                        'Pay',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
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
