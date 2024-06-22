import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   LoginView({Key? key}) : super(key: key);
   final LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body:  SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.all(15),
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
                          Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            // controller: namaController,
                            onChanged: controller.onEmailChanged,
                           decoration: InputDecoration(
                            labelText: 'Email',
                              hintText: 'Email',
                              border:OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Input Email';
                              }
                              return null;
                            }
                          ),
                          SizedBox(height: 18),
                          
                          TextFormField(
                            // controller: jumlahController,
                            onChanged: controller.onPasswordChanged,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Password',
                              border: OutlineInputBorder()
                              ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Input Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                          
              
                    ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: Text('Sumbit'),
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
      ),
    )
      
    );
  }
}