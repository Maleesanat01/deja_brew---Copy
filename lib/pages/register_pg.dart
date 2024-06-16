// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_local_variable
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPg extends StatefulWidget {
  @override
  _RegisterPgState createState() => _RegisterPgState();
}

class _RegisterPgState extends State<RegisterPg> {
  Color myColor = Color.fromARGB(255, 255, 254, 254);

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _retrieveUserContactInfo();
  }

  Future<void> _retrieveUserContactInfo() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();

    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      if (contacts.isNotEmpty) {
        Contact contact = contacts.first;
        if (contact.emails!.isNotEmpty) {
          emailController.text = contact.emails!.first.value!;
        }
        if (contact.phones!.isNotEmpty) {
          phoneController.text = contact.phones!.first.value!;
        }
      }
    } else {
      openAppSettings();
    }
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pushNamed(context, '/LogInPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showErrorDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showErrorDialog('The account already exists for that email.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred. Please try again.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 55),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 0),
                        child: Image.asset('assets/images/deja_logo.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Deja Brew",
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "+94 70 111 2222",
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "deja.brew@gmail.com",
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add more complex password validation logic if needed
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "●●●●●●●",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 45),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
                    },
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
                            'Register',
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
        ),
      ),
    );
  }
}
