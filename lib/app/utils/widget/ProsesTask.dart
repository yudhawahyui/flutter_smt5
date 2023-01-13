import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:flutter_smt5/app/utils/style/AppColor.dart';
import 'package:get/get.dart';

addEditTask({BuildContext? context, String? type, String? docId}) {
  final authCon = Get.find<AuthController>();

  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        margin: context!.isPhone
            ? const EdgeInsets.only(top: 25, left: 25, right: 25)
            : const EdgeInsets.only(top: 25, left: 25, right: 25),
        padding: context.isPhone
            ? const EdgeInsets.only(top: 25, left: 25, right: 25)
            : const EdgeInsets.only(top: 25, left: 25, right: 25),
        height: Get.height * 0.546,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Form(
          key: authCon.formKey,
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
                controller: authCon.titleController,
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
                  if (value == null || value.isEmpty) {
                    return "Title can not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: authCon.descController,
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
                  if (value == null || value.isEmpty) {
                    return "Description can not be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DateTimePicker(
                controller: authCon.dueDateController,
                firstDate: DateTime.now(),
                calendarTitle: "Select Due Date",
                lastDate: DateTime(2100),
                dateLabelText: "Due Date",
                dateHintText: "Due Date",
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                    authCon.saveUpdateTask(
                      authCon.titleController.text,
                      authCon.descController.text,
                      authCon.dueDateController.text,
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
