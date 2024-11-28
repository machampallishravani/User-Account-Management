import 'dart:io';

import 'package:act_management/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController frstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrmPasswordController = TextEditingController();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: const Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => settingModalBottomSheet(context),
                  child: ClipOval(
                      child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 50,
                          ))),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: frstNameController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please Enter First Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "First Name",
                    prefixIcon: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please Enter Last Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    prefixIcon: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: mobleController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please enter mobile number";
                    } else if (value.length > 10 || value.length < 10) {
                      return "Please enter a valid mobile number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    prefixIcon: const Icon(Icons.phone),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please enter email";
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please provide the password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: confrmPasswordController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please provide the confirm password";
                    } else if (passwordController.text !=
                        confrmPasswordController.text) {
                      return "Password and Confirm Password should be same";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: const Icon(Icons.password),
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
                      }
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          _clickImage(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                        )),
                    const Text(
                      "Camera",
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          _pickImage(context);
                        },
                        icon:
                            const Icon(Icons.photo_size_select_actual_rounded)),
                    const Text(
                      "Gallery",
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }

  Future<void> _pickImage(context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    file = File(pickedFile!.path);
    Navigator.pop(context);
    setState(() {});
  }

  Future<void> _clickImage(context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    file = File(pickedFile!.path);
    Navigator.pop(context);
    setState(() {});
  }
}
