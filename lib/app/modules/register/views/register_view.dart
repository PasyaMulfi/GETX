import 'package:belajar_getx/app/helpers/size_helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("REGISTER"),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          onChanged: controller.onNameChanged,
                          decoration: InputDecoration(
                              hintText: "Name", border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'input nama';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          onChanged: controller.onEmailChanged,
                          decoration: InputDecoration(
                              hintText: "Email", border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'input email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          onChanged: controller.onPasswordChanged,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Password ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.8,
                          height: displayHeight(context) * 0.075,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  side: BorderSide(color: Colors.white60),
                                ),
                              ),
                            ),
                            child: Text("simpan"),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.register();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/login");
                          },
                          child: Text(
                            "Kembali Ke Login",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
