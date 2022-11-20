import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

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
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage: NetworkImage(
                          "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Ahmad Kratos",
                        style: TextStyle(
                          fontSize: 40,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      Text(
                        "God of War | New All Father | ahmad.kratos@olympus.com",
                        style: TextStyle(
                          fontSize: 15,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 150,
                      foregroundImage: NetworkImage(
                          "https://cdn.mos.cms.futurecdn.net/XDLmYsaAh4xF2yVzqVZPva.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Ahmad Kratos",
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const Text(
                    "God of War | New All Father | ahmad.kratos@olympus.com",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
