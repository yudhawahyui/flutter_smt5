import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/routes/app_pages.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Flutter Management",
                  style: TextStyle(fontSize: 25, color: AppColors.primaryText),
                ),
                Text(
                  "Manage Task easily",
                  style: TextStyle(fontSize: 15, color: AppColors.primaryText),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.notifications,
                color: AppColors.primaryText, size: 30),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: "Sign Out",
                  content: const Text("Are you sure to sign out?"),
                  cancel: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Cancel"),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: const Text("Sign Out"),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    "Sign Out",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.logout,
                    color: AppColors.primaryText,
                    size: 30,
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
