// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages, sort_child_properties_last, library_private_types_in_public_api
//shop_pg.dart file
import '../models/cart.dart';
import '../models/item.dart';
import '../pages/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPg extends StatefulWidget {
  const ShopPg({Key? key}) : super(key: key);

  @override
  _ShopPgState createState() => _ShopPgState();
}

class _ShopPgState extends State<ShopPg> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 254, 254),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Discover the latest offers for you...',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 109, 75, 62)),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/offer1.jpg',
                            height: 210,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/OffersPage');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Text(
                                'See More',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.brown.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Top Picks',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),

                    // Horizontal scroll for hot picks
                    Container(
                      height: 360,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cart.getTopPicksDetails().length,
                        itemBuilder: (context, index) {
                          Item details = cart.getTopPicksDetails()[index];
                          return Row(
                            children: [
                              SizedBox(
                                width: 220,
                                child: ItemCard(
                                  item: details,
                                ),
                              ),
                              SizedBox(width: 16),
                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 40),
                    Text(
                      'Hot Beverages',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    // Horizontal scroll for hot beverages
                    Container(
                      height: 360,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cart.getHotBevDetails().length,
                        itemBuilder: (context, index) {
                          Item details = cart.getHotBevDetails()[index];
                          return Row(
                            children: [
                              SizedBox(
                                width: 220,
                                child: ItemCard(
                                  item: details,
                                ),
                              ),
                              SizedBox(width: 16),
                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 40),
                    Text(
                      'Cold Beverages',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    // Horizontal scroll for hot beverages
                    Container(
                      height: 360,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cart.getColdBevDetails().length,
                        itemBuilder: (context, index) {
                          Item details = cart.getColdBevDetails()[index];
                          return Row(
                            children: [
                              SizedBox(
                                width: 220,
                                child: ItemCard(
                                  item: details,
                                ),
                              ),
                              SizedBox(width: 16),
                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 40),
                    Text(
                      'Desserts',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    // Horizontal scroll for hot beverages
                    Container(
                      height: 360,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cart.getDessertDetails().length,
                        itemBuilder: (context, index) {
                          Item details = cart.getDessertDetails()[index];
                          return Row(
                            children: [
                              SizedBox(
                                width: 220,
                                child: ItemCard(
                                  item: details,
                                ),
                              ),
                              SizedBox(width: 16),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
