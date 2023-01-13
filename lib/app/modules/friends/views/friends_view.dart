import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/routes/app_pages.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:flutter_smt5/app/utils/widget/Header.dart';
import 'package:flutter_smt5/app/utils/widget/PeopleYouMayKnow.dart';
import 'package:flutter_smt5/app/utils/widget/SideBar.dart';
import 'package:flutter_smt5/app/utils/widget/myFriends.dart';

import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final authCon = Get.find<AuthController>();
  FriendsView({super.key});

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
                          child: Column(
                            children: [
                              Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                              SizedBox(
                                height: context.height * 0.01,
                              ),
                              context.isPhone
                                  ? TextField(
                                      onChanged: (value) =>
                                          authCon.searchFriends(value),
                                      controller:
                                          authCon.searchFriendsController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.only(
                                            left: 40, right: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: Colors.blue),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                        hintText: "Search",
                                      ),
                                    )
                                  : const SizedBox(),
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
                      child: Obx(
                        () => authCon.hasilPencarian.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "People May You Know",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: AppColors.secondaryText),
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
                                        onTap: () =>
                                            Get.toNamed(Routes.FRIENDS),
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
                                  MyFriends(),
                                ],
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: authCon.hasilPencarian.length,
                                itemBuilder: (context, index) => ListTile(
                                  onTap: () => authCon.addFriends(
                                      authCon.hasilPencarian[index]["email"]),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 25,
                                      foregroundImage: NetworkImage(authCon
                                          .hasilPencarian[index]["photo"]),
                                    ),
                                  ),
                                  title: Text(
                                    authCon.hasilPencarian[index]["name"],
                                  ),
                                  subtitle: Text(
                                    authCon.hasilPencarian[index]["email"],
                                  ),
                                  trailing: const Icon(UniconsLine.plus),
                                ),
                              ),
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
