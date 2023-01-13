import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:flutter_smt5/app/utils/widget/ProsesTask.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MyTask extends StatelessWidget {
  MyTask({
    Key? key,
  }) : super(key: key);
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Stream User For Get Task List
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: authCon.streamUsers(authCon.auth.currentUser!.email!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Get Task Id
          var taskId = (snapshot.data!.data()
              as Map<dynamic, dynamic>)['task_id'] as List;

          return ListView.builder(
            clipBehavior: Clip.antiAlias,
            shrinkWrap: true,
            itemCount: taskId.length,
            itemBuilder: (context, index) {
              return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: authCon.streamTasks(taskId[index]),
                builder: (context, snapshot2) {
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot2.data!.data() == null) {
                    return const SizedBox(
                      height: 0,
                    );
                  }

                  // Get Task Data
                  var dataTask = snapshot2.data!.data();

                  // Get User Photo
                  var dataUserList = (snapshot2.data!.data()
                      as Map<String, dynamic>)['asign_to'] as List;

                  return GestureDetector(
                    onLongPress: () {
                      Get.defaultDialog(
                        title: dataTask['title'],
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                Get.back();
                                authCon.titleController.text =
                                    dataTask['title'];
                                authCon.descController.text = dataTask['desc'];
                                authCon.dueDateController.text =
                                    dataTask['due_date'];
                                addEditTask(
                                  context: context,
                                  type: 'Update Task',
                                  docId: taskId[index],
                                );
                              },
                              icon: const Icon(UniconsLine.pen),
                              label: const Text('Update'),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                authCon.deleteTask(
                                  taskId[index],
                                );
                              },
                              icon: const Icon(UniconsLine.trash),
                              label: const Text('Delete'),
                            )
                          ],
                        ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                child: Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: dataUserList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemBuilder: (context, index2) {
                                      return StreamBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                        stream: authCon
                                            .streamUsers(dataUserList[index2]),
                                        builder: (context, snapshot3) {
                                          if (snapshot3.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          var dataUserImage =
                                              snapshot3.data!.data();

                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius: 20,
                                              foregroundImage: NetworkImage(
                                                dataUserImage!['photo'],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                color: AppColors.primaryBg,
                                child: Center(
                                  child: Text(
                                    "${dataTask!['status']} %",
                                    style: const TextStyle(
                                        color: AppColors.primaryText),
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
                            child: Center(
                              child: Text(
                                "${dataTask['total_task_finished']} / ${dataTask['total_task']}",
                                style: const TextStyle(
                                    color: AppColors.primaryText),
                              ),
                            ),
                          ),
                          Text(
                            dataTask['title'],
                            style: const TextStyle(
                                color: AppColors.secondaryText, fontSize: 20),
                          ),
                          Text(
                            dataTask['desc'],
                            style:
                                const TextStyle(color: AppColors.secondaryText),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
