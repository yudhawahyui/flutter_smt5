import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:get/get.dart';

import '../style/AppColor.dart';

class MyFriends extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                height: 700,
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: authCon.streamFriends(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.data!.data() == null) {
                      return const Center(
                        child: Text("You don't have any friends"),
                      );
                    }

                    var myFriends = (snapshot.data!.data() ??
                        '' as Map<String, dynamic>)['emailFriends'] as List;

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: myFriends.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: !context.isPhone ? 4 : 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          stream: authCon.streamUsers(myFriends[index]),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.data!.data() == null) {
                              return const Center(
                                child: Text("You don't have any friends"),
                              );
                            }

                            var data = snapshot2.data!.data();

                            return Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: !context.isPhone
                                        ? Image(
                                            image: NetworkImage(data!['photo']),
                                            height: 120,
                                            width: 150,
                                            fit: BoxFit.cover)
                                        : Image(
                                            image: NetworkImage(data!['photo']),
                                            height: Get.height * 0.15,
                                            width: Get.width * 0.5,
                                            fit: BoxFit.cover)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                      color: AppColors.secondaryText),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
