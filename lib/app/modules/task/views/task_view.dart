import 'package:date_time_picker/date_time_picker.dart';
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
                                      "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
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
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onLongPress: () {
                                      addEditTask(
                                        context: context,
                                        type: 'Update Task',
                                        docId: '2022-12-21T04:48:00.833842',
                                      );
                                    },
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        color: AppColors
                                                            .primaryText),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 100,
                                            color: AppColors.primaryBg,
                                            child: const Center(
                                              child: Text(
                                                "10/10 Tasks",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryText),
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
                                    ),
                                  );
                                }),
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
      floatingActionButton: Align(
        alignment: const Alignment(.9, .9),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditTask(
              context: context,
              type: "Add Task",
              docId: '',
            );
          },
          label: const Text("Add Task"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  addEditTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          margin: context!.isPhone
              ? const EdgeInsets.only(top: 25, left: 25, right: 25)
              : const EdgeInsets.only(top: 25, left: 25, right: 25),
          padding: context.isPhone
              ? const EdgeInsets.only(top: 25, left: 25, right: 25)
              : const EdgeInsets.only(top: 25, left: 25, right: 25),
          height: Get.height * .5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  "$type",
                  style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    hintText: "Title Task",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Title Task",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  validator: (value) {
                    if (value == null) {
                      return "Title can not be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.descController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Description can not be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                DateTimePicker(
                  controller: controller.dueDateController,
                  firstDate: DateTime.now(),
                  calendarTitle: "Select Due Date",
                  lastDate: DateTime(2100),
                  dateLabelText: "Due Date",
                  dateHintText: "Due Date",
                  validator: (value) {
                    if (value == null) {
                      return "Due Date can not be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Due Date",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: "Due Date",
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: Get.width, height: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.saveUpdateTask(
                        controller.titleController.text,
                        controller.descController.text,
                        controller.dueDateController.text,
                        docId.toString(),
                        type.toString(),
                      );
                    },
                    child: Text(
                      "$type",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
