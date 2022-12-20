import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../routes/app_pages.dart';
import '../style/AppColor.dart';

class MyFriends extends StatelessWidget {
  final autchCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: autchCon.streamFriends(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var myFriends = (snapshot.data!.data()
                        as Map<String, dynamic>)['emailFriends'] as List;

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: myFriends.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: !context.isPhone ? 3 : 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          stream: autchCon.streamUsers(myFriends[index]),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            var data = snapshot2.data!.data();

                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(data!['photo']),
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
