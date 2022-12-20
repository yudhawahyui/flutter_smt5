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
                      } else if (snapshot.data!.data()!.isEmpty) {
                        return const Center(
                          child: Text("No Friends"),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Error"),
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
                                } else if (snapshot2.data!.data()!.isEmpty) {
                                  return const Center(
                                    child: Text("No Friends"),
                                  );
                                } else if (snapshot2.hasError) {
                                  return const Center(
                                    child: Text("Error"),
                                  );
                                }

                                var data = snapshot2.data!.data();

                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                        image: NetworkImage(data!['photo']),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data['name'],
                                      style: const TextStyle(
                                          color: AppColors.secondaryText),
                                    ),
                                  ],
                                );
                              });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
