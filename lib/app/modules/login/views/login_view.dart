import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboard_coolva/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'package:onboard_coolva/app/core/values/assets/app_image.dart';
import 'package:onboard_coolva/app/core/values/assets/app_icon.dart';
import 'package:onboard_coolva/app/core/theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      color: AppColor.neutral700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Image.asset(AppImages.loginHero, height: 360, width: 360),
                ],
              ),
              const Spacer(flex: 3),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, width: 1.5),
                ),
                child: GestureDetector(
                  onTap: () async {
                    final userCredential = await controller.signInWithGoogle();
                    if (userCredential != null) {
                      Get.toNamed(Routes.HOME);
                      Get.snackbar('Login Berhasil', 'Selamat datang, ${userCredential.user?.displayName ?? ''}');
                    } else {
                      Get.snackbar('Login Gagal', 'Tidak dapat masuk dengan akun Google');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.googleLogo,
                          height: 36,
                          width: 36,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Masuk dengan akun Google',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColor.neutral700,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
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
