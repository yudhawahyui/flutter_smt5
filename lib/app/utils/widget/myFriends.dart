import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../routes/app_pages.dart';
import '../style/AppColor.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
  }) : super(key: key);

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
                height: 400,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 80,
                            foregroundImage: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Elon_Musk_2015.jpg/640px-Elon_Musk_2015.jpg"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Elon Musk",
                          style: TextStyle(color: AppColors.secondaryText),
                        ),
                      ],
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
