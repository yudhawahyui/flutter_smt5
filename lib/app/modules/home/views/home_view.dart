import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_smt5/app/routes/app_pages.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:flutter_smt5/app/utils/widget/Header.dart';
import 'package:flutter_smt5/app/utils/widget/PeopleYouMayKnow.dart';
import 'package:flutter_smt5/app/utils/widget/SideBar.dart';
import 'package:flutter_smt5/app/utils/widget/myFriends.dart';
import 'package:flutter_smt5/app/utils/widget/myTask.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final authCon = Get.find<AuthController>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : const SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const Header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Flutter Management",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primaryText),
                                  ),
                                  Text(
                                    "Manage Task easily",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.notifications,
                                  color: AppColors.primaryText, size: 30),
                              const SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      authCon.auth.currentUser!.photoURL!),
                                ),
                              ),
                            ],
                          ),
                        ),
                  // Content Page Screen
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(20)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "People you may know",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                PeopleYouMayKnow(),
                                Row(
                                  children: [
                                    const Text(
                                      "My Friends",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: AppColors.secondaryText,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () => Get.toNamed(Routes.FRIENDS),
                                      child: const Text(
                                        "More",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.secondaryText,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      UniconsLine.arrow_right,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Upcoming & My friends
                          !context.isPhone
                              ? Expanded(
                                  child: Row(
                                    children: [
                                      MyTask(),
                                      MyFriends(),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "My Tasks",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.secondaryText,
                                        ),
                                      ),
                                      MyTask(),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
