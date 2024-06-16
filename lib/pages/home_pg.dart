// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace
import 'package:deja_brew/pages/branches_pg.dart';
import 'package:deja_brew/pages/suggestions_pg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/shop_pg.dart';
import '../pages/cart_pg.dart';
import '../pages/profile_pg.dart';
import '../models/cart.dart';

class HomePg extends StatefulWidget {
  const HomePg({Key? key}) : super(key: key);

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 119, 74, 58),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 119, 74, 58),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePg()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedIndex != 4)
            Container(
              color: Color.fromARGB(255, 255, 254, 254),
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: const EdgeInsets.only(left: 12.0),
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                ShopPg(),
                SuggestionsPg(),
                BranchesPg(),
                CartPg(),
                ProfilePg(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          backgroundColor: Colors.white,
          activeColor: Color.fromARGB(255, 66, 33, 21),
          color: Color.fromARGB(255, 150, 124, 114),
          tabBackgroundColor: Color.fromARGB(255, 233, 217, 210),
          gap: 8,
          onTabChange: (index) {
            //take the index of the page that user is currently on and pass it as parameter and set that index to selectindex
            setState(() {
              _selectedIndex = index;
            });
          },
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.coffee,
              text: 'Suggestions',
            ),
            GButton(
              icon: Icons.location_on,
              text: 'Branches',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'My Cart',
              leading: _buildCartIcon(context, _selectedIndex == 3),
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 75, 37, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 230,
                    child: DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        'assets/images/deja_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Divider(
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/ShopPage');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                  title: const Text(
                    'Offers',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/OffersPage');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_basket,
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                  title: const Text(
                    'Shop',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                  title: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Color.fromARGB(255, 235, 233, 233),
                  ),
                  title: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '');
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
              child: ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 235, 233, 233),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Color.fromARGB(255, 235, 233, 233)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/SettingsPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//widget to display badge on car ticon to indicate no.of.items in cart
  Widget _buildCartIcon(BuildContext context, bool isSelected) {
    int itemCount = Provider.of<Cart>(context).getUserCart().length;
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.shopping_cart,
          color: isSelected
              ? Color.fromARGB(255, 66, 33, 21)
              : Color.fromARGB(255, 150, 124, 114),
        ),
        if (itemCount > 0)
          Positioned(
            top: 0,
            left: 8,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$itemCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
