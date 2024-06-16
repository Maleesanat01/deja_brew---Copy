// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPg extends StatefulWidget {
  LoginPg({Key? key}) : super(key: key);

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  Color myColor = Color.fromARGB(255, 255, 254, 254);
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, //uniquely identifies form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 65),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 40, right: 40),
                        child: Image.asset('assets/images/deja_logo.png'),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  onChanged: (value) {
                    setState(() {});
                  },
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
                  controller: _passwordController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
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
                    hintText: "●●●●●●●",
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.brown,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              if (user != null) {
                                Navigator.pushNamed(context, '/HomePage');
                              }
                            } catch (ex) {
                              setState(() {
                                errorMessage = "Invalid Email or Password";
                              });
                            }
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
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/RegisterPage');
                        },
                        child: Text(
                          "Don't have an account? Click Here To Register",
                          style: TextStyle(
                            color: Colors.brown,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
