// import 'package:belajar_getx/app/helpers/size_helper.dart';
import 'package:belajar_getx/app/helpers/size_helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  // var _isLoading = false;
  bool _isHiddenPassword = true;
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Back text
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Login text
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // Image
              Container(
                height: 290,
                width: double.infinity, // Ganti tinggi sesuai kebutuhan Anda
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  '',
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 10),

              // Form
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    // Email TextFormField
                    TextFormField(
                      // controller: emailController,
                      onChanged: controller.onEmailChanged,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Harus Di Isi!!';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    // Password TextFormField
                    TextFormField(
                      obscureText: _isHiddenPassword,
                      onChanged: controller.onPasswordChanged,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            // setState(() {
                            //   _isHiddenPassword = !_isHiddenPassword;
                            // });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Harus Di Isi!!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Register text and button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Belum Punya Akun? "),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                      // );
                    },
                    child: Text('Register'),
                  ),
                ],
              ),

              SizedBox(height: 15),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: displayHeight(context) * 0.075,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}