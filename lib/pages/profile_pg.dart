// profile_pg.dart
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'dart:typed_data';
import 'package:deja_brew/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePg extends StatefulWidget {
  const ProfilePg({Key? key}) : super(key: key);

  @override
  State<ProfilePg> createState() => _ProfilePgState();
}

class _ProfilePgState extends State<ProfilePg> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _retrieveContactInfo();
  }

  Future<void> _retrieveContactInfo() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus == PermissionStatus.granted) {
      //get user contacts
      Iterable<Contact> contacts = await ContactsService.getContacts();
      if (contacts.isNotEmpty) {
        //gets the first contact
        Contact contact = contacts.first;

        //set email and phone num to controllers
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

  Future<void> selectImage(ImageSource source) async {
    Uint8List? img = source == ImageSource.gallery
        ? await pickImageFromGallery(source)
        : await pickImageFromCamera(); //type list represent image data in memory
    if (img != null) {
      setState(() {
        _image = img; //set picked img to variable image
      });
    }
  }

  void showUploadImageOptions(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              color: Color.fromARGB(255, 66, 33, 21),
                              size: 50,
                            ),
                            Text('Gallery'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectImage(ImageSource.camera);
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Color.fromARGB(255, 66, 33, 21),
                              size: 50,
                            ),
                            Text('Camera'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, //uniquely identifies form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 90,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : CircleAvatar(
                              radius: 90,
                              backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/564x/c2/7e/b7/c27eb77c278f37d9a204bff5a661b83b.jpg'),
                            ),
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            showUploadImageOptions(context);
                          },
                          icon: Icon(
                            Icons.add_a_photo_rounded,
                            color: Color.fromARGB(255, 66, 33, 21),
                            size: 30,
                          ),
                        ),
                        bottom: 0,
                        left: 125,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Name',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
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
                      return 'Please enter your email address';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 66, 33, 21),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Center(
                          child: Text(
                            'Save',
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
