// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, //avoid_function_literals_in_foreach_calls, unused_local_variable, prefer_const_constructors
import 'package:deja_brew/pages/branch_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/branch.dart';
import '../utils.dart';

class BranchesPg extends StatefulWidget {
  @override
  _BranchesPgState createState() => _BranchesPgState();
}

class _BranchesPgState extends State<BranchesPg> {
  List<Branch> _closestBranches = [];
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    super.initState();
    _displayClosestBranches();
  }

  Future<void> _displayClosestBranches() async {
    try {
      Position userLocation = await getUserLocation();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;

      List<Branch> branches = [
        Branch(
            name: 'Mountain View, CA',
            latitude: 37.386051,
            longitude: -122.083855,
            distance: 0),
        Branch(
            name: 'Sunnyvale, CA',
            latitude: 37.383999,
            longitude: -122.012772,
            distance: 0),
        Branch(
            name: 'Downtown San Jose',
            latitude: 37.335480,
            longitude: -121.893028,
            distance: 0),
        Branch(
            name: 'Santa Clara, CA',
            latitude: 37.354107,
            longitude: -121.955238,
            distance: 0),
        Branch(
            name: 'Ranch Dr, Milpitas, CA',
            latitude: 37.427922,
            longitude: -121.923169,
            distance: 0),
      ];

      for (var branch in branches) {
        branch.distance = Geolocator.distanceBetween(userLocation.latitude,
            userLocation.longitude, branch.latitude, branch.longitude);
      }

      branches.sort((a, b) => a.distance.compareTo(b.distance));
      setState(() {
        _closestBranches = branches;
      });
    } catch (e) {
      print('Error loading branches: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Closest Branches',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: _closestBranches.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemCount: _closestBranches.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10), //space between cards
                      itemBuilder: (context, index) {
                        final branch = _closestBranches[index];
                        return BranchCard(branch: branch);
                      },
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _displayClosestBranches();
              },
              icon: Icon(
                Icons.refresh,
                color: Color.fromARGB(255, 66, 33, 21),
              ),
              label: Text(
                'Refresh',
                style: TextStyle(color: Color.fromARGB(255, 66, 33, 21)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
