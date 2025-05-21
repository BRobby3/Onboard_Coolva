import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';



class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.toNamed(Routes.HOME);
        }, child: Text("Home")),
      ),
    );
  }
}
