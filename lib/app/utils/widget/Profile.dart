import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({
    Key? key,
  }) : super(key: key);
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage:
                          NetworkImage(authCon.auth.currentUser!.photoURL!),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        authCon.auth.currentUser!.displayName!,
                        style: const TextStyle(
                          fontSize: 40,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        authCon.auth.currentUser!.email!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage:
                          NetworkImage(authCon.auth.currentUser!.photoURL!),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    authCon.auth.currentUser!.displayName!,
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Text(
                    authCon.auth.currentUser!.email!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
