import 'package:flutter/cupertino.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter/material.dart';
import '../../routes/app_pages.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        height: Get.height,
        color: AppColors.primaryBg,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                width: double.infinity,
                alignment: Alignment.topCenter,
                height: 100,
                child: const Image(
                  image: AssetImage('./assets/icons/icon.png'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                // Home
                height: 100,
                child: Center(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: Get.currentRoute == "/home"
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                )
                              : const BoxDecoration(),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          child: Icon(
                            Get.currentRoute == "/home"
                                ? UniconsLine.desktop
                                : UniconsLine.desktop_alt,
                            color: Get.currentRoute == "/home"
                                ? AppColors.secondaryText
                                : AppColors.primaryText,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                ),
              ),
              SizedBox(
                // Task
                height: 100,
                child: Center(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: Get.currentRoute == "/task"
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                )
                              : const BoxDecoration(),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          child: Icon(
                            Get.currentRoute == "/task"
                                ? UniconsLine.box
                                : UniconsLine.cube,
                            color: Get.currentRoute == "/task"
                                ? AppColors.secondaryText
                                : AppColors.primaryText,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Task',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.TASK);
                    },
                  ),
                ),
              ),
              SizedBox(
                // Friends
                height: 100,
                child: Center(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: Get.currentRoute == "/friends"
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                )
                              : const BoxDecoration(),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          child: Icon(
                            Get.currentRoute == "/friends"
                                ? UniconsLine.comment_heart
                                : UniconsLine.heart,
                            color: Get.currentRoute == "/friends"
                                ? AppColors.secondaryText
                                : AppColors.primaryText,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Friends',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.FRIENDS);
                    },
                  ),
                ),
              ),
              SizedBox(
                // profile
                height: 100,
                child: Center(
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: Get.currentRoute == "/profile"
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                )
                              : const BoxDecoration(),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          child: Icon(
                            Get.currentRoute == "/profile"
                                ? UniconsLine.user_square
                                : UniconsLine.user,
                            color: Get.currentRoute == "/profile"
                                ? AppColors.secondaryText
                                : AppColors.primaryText,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
