// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:deja_brew/models/offer.dart';
import 'package:deja_brew/pages/offer_card.dart';

class OffersPg extends StatelessWidget {
  const OffersPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Top Offers',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < 5; index++)
                    Column(
                      children: [
                        OfferCard(
                          offer: getOfferDetails(index),
                        ),
                        SizedBox(height: 45),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Offer getOfferDetails(int index) {
  switch (index) {
    case 0:
      return Offer(
        imagePath: 'assets/images/offer5.jpg',
        description: 'Valid until February 28th',
      );
    case 1:
      return Offer(
        imagePath: 'assets/images/offer2.jpg',
        description: 'Valid until March 5th.',
      );
    case 2:
      return Offer(
        imagePath: 'assets/images/offer3.jpg',
        description: 'Valid until February 20th.',
      );
    case 3:
      return Offer(
        imagePath: 'assets/images/offer4.jpg',
        description: 'Valid until February 15th.',
      );
    case 4:
      return Offer(
        imagePath: 'assets/images/banner.jpg',
        description: 'Valid until February 25th',
      );
    default:
      return Offer(
        imagePath: 'assets/images/offer1.jpg',
        description: 'Valid until February 28th',
      );
  }
}
