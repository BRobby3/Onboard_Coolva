import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Track This Job!",
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(58, 71, 100, 1.0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Image.asset(
                    'illustration_tracking@2x.png',
                    height: 360,
                    width: 360,
                  ),
                ],
              ),
              const Spacer(flex: 3),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('ic_google.png', height: 36, width: 36),
                        const SizedBox(width: 32),
                        const Text(
                          'Masuk dengan akun Google',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(58, 71, 100, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
