import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';

import 'package:get/get.dart';

import 'package:unicons/unicons.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: context.isPhone
            ? EdgeInsets.all(Get.width * 0.1)
            : EdgeInsets.all(Get.height * 0.1),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: AppColors.primaryText,
        ),

        // Biru
        child: Row(
          children: [
            !context.isPhone
                ?
                // Biru
                Expanded(
                    child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      color: AppColors.primaryBg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: AppColors.primaryText, fontSize: 70),
                        ),
                        Text("Please Login",
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: 30)),
                        Text("Start Journey With Us.",
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: 30)),
                      ],
                    ),
                  ))
                : const SizedBox(),

            // Putih
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: AppColors.primaryText,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.isPhone
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                  color: AppColors.secondaryText, fontSize: 35),
                            ),
                            const Text("Please Login",
                                style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: 15)),
                            const Text("Start Journey With Us.",
                                style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: 15)),
                          ],
                        )
                      : const SizedBox(),
                  Image.asset(
                    "images/login.png",
                    height: Get.height * 0.5,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: AppColors.primaryBg,
                    onPressed: () => Get.toNamed("/home"),
                    label: const Text("Login with Google"),
                    icon: const Icon(
                      UniconsLine.google,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
