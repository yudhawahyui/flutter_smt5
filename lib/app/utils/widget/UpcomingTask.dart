import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';

class UpcomingTask extends StatelessWidget {
  UpcomingTask({
    Key? key,
  }) : super(key: key);
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upcoming Task",
              style: TextStyle(
                fontSize: 25,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 500,
              child: ListView(
                clipBehavior: Clip.antiAlias,
                shrinkWrap: true,
                // scrollDirection:
                //     Axis.vertical,
                children: [
                  Container(
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
                              borderRadius: BorderRadius.circular(30),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    authC.auth.currentUser!.photoURL!),
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
                              style: TextStyle(color: AppColors.primaryText),
                            ),
                          ),
                        ),
                        const Text(
                          "Flutter Management",
                          style: TextStyle(
                              color: AppColors.secondaryText, fontSize: 20),
                        ),
                        const Text(
                          "Deadline 20/10/2021",
                          style: TextStyle(color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
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
                                  style:
                                      TextStyle(color: AppColors.primaryText),
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
                              style: TextStyle(color: AppColors.primaryText),
                            ),
                          ),
                        ),
                        const Text(
                          "Flutter Management",
                          style: TextStyle(
                              color: AppColors.secondaryText, fontSize: 20),
                        ),
                        const Text(
                          "Deadline 20/10/2021",
                          style: TextStyle(color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 20,
                                foregroundImage: NetworkImage(
                                    "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
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
                                  style:
                                      TextStyle(color: AppColors.primaryText),
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
                              style: TextStyle(color: AppColors.primaryText),
                            ),
                          ),
                        ),
                        const Text(
                          "Flutter Management",
                          style: TextStyle(
                              color: AppColors.secondaryText, fontSize: 20),
                        ),
                        const Text(
                          "Deadline 20/10/2021",
                          style: TextStyle(color: AppColors.secondaryText),
                        ),
                      ],
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
