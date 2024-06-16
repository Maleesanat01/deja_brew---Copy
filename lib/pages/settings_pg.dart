// settings_pg.dart
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';

class SettingsPg extends StatefulWidget {
  const SettingsPg({super.key});

  @override
  _SettingsPgState createState() => _SettingsPgState();
}

class _SettingsPgState extends State<SettingsPg> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.grey[900] : Color.fromARGB(255, 255, 254, 254),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 25,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset('assets/images/user_profile1.png',
                      height: 230, width: 230),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                          color: isDarkMode
                              ? const Color.fromARGB(255, 173, 125, 107)
                              : const Color.fromARGB(255, 146, 103, 88),
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                      activeColor: Color.fromARGB(255, 153, 125, 113),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: isDarkMode
                        ? const Color.fromARGB(255, 173, 125, 107)
                        : const Color.fromARGB(255, 146, 103, 88),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: isDarkMode
                        ? const Color.fromARGB(255, 173, 125, 107)
                        : const Color.fromARGB(255, 146, 103, 88),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: isDarkMode
                        ? const Color.fromARGB(255, 173, 125, 107)
                        : const Color.fromARGB(255, 146, 103, 88),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/LogInPage');
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
