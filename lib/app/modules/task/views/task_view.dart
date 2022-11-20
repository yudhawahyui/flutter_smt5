import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:flutter_smt5/app/utils/widget/Header.dart';
import 'package:flutter_smt5/app/utils/widget/SideBar.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body: Row(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Elon_Musk_2015.jpg/640px-Elon_Musk_2015.jpg"),
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
                        const Text(
                          "My Tasks",
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            clipBehavior: Clip.antiAlias,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: ((context, index) {
                              return Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.amber,
                                            radius: 20,
                                            foregroundImage: NetworkImage(
                                                "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.amber,
                                            radius: 20,
                                            foregroundImage: NetworkImage(
                                                "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.amber,
                                            radius: 20,
                                            foregroundImage: NetworkImage(
                                                "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 25,
                                          width: 80,
                                          color: AppColors.primaryBg,
                                          child: const Center(
                                            child: Text(
                                              "100%",
                                              style: TextStyle(
                                                  color: AppColors.primaryText),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 25,
                                      width: 80,
                                      color: AppColors.primaryBg,
                                      child: const Center(
                                        child: Text(
                                          "10/10 Tasks",
                                          style: TextStyle(
                                              color: AppColors.primaryText),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Flutter Management",
                                      style: TextStyle(
                                          color: AppColors.secondaryText,
                                          fontSize: 20),
                                    ),
                                    const Text(
                                      "Deadline 20/10/2021",
                                      style: TextStyle(
                                          color: AppColors.secondaryText),
                                    ),
                                  ],
                                ),
                              );
                            }),
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
      floatingActionButton: Align(
        alignment: const Alignment(.9, .9),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.bottomSheet(
              Container(
                margin: !context.isPhone
                    ? EdgeInsets.only(left: 100, right: 100)
                    : EdgeInsets.zero,
                height: Get.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
              ),
            );
          },
          label: const Text("Add Task"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
