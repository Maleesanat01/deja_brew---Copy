// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:deja_brew/models/offer.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 150,
                width: double.infinity,
                child: Image.asset(
                  offer.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 8),
            child: Text(
              offer.description,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
