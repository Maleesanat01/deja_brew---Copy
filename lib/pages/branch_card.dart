// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import '../models/branch.dart';

class BranchCard extends StatefulWidget {
  final Branch branch;

  const BranchCard({Key? key, required this.branch}) : super(key: key);

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
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
                child: Icon(Icons.location_on_outlined)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.branch.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Distance: ${(widget.branch.distance / 1000).toStringAsFixed(2)} Km',
                  style: TextStyle(color: Colors.brown[900]),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
