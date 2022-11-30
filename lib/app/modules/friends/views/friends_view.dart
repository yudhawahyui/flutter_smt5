import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:flutter_smt5/app/utils/widget/Header.dart';
import 'package:flutter_smt5/app/utils/widget/SideBar.dart';
import 'package:flutter_smt5/app/utils/widget/myFriends.dart';

import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final autchCon = Get.find<AuthController>();
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
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 25,
                                      foregroundImage: NetworkImage(
                                          "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
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
                                          autchCon.searchFriends(value),
                                      controller:
                                          autchCon.searchFriendsController,
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
                        () => autchCon.hasilPencarian.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "People May You Know",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: AppColors.secondaryText),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 10,
                                      clipBehavior: Clip.antiAlias,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: const Image(
                                                  image: NetworkImage(
                                                      "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                                                ),
                                              ),
                                              const Positioned(
                                                left: 10,
                                                top: 10,
                                                child: Text(
                                                  "Ahmad Kratos",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                right: 10,
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: const Icon(
                                                        UniconsLine
                                                            .plus_circle),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const MyFriends(),
                                ],
                              )
                            : ListView.builder(
                                padding: EdgeInsets.all(8),
                                itemCount: autchCon.hasilPencarian.length,
                                itemBuilder: (context, index) => ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 25,
                                      foregroundImage: NetworkImage(autchCon
                                          .hasilPencarian[index]["photo"]),
                                    ),
                                  ),
                                  title: Text(
                                    autchCon.hasilPencarian[index]["name"],
                                  ),
                                  subtitle: Text(
                                    autchCon.hasilPencarian[index]["email"],
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
