import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smt5/app/data/controller/authController.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  UserCredential? _userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authCon = Get.find<AuthController>();

  late TextEditingController titleController, descController, dueDateController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
    descController.dispose();
    dueDateController.dispose();
  }

  void saveUpdateTask(
    String? title,
    String? desc,
    String? dueDate,
    String? docId,
    String? type,
  ) async {
    print(title);
    print(desc);
    print(dueDate);
    print(docId);
    print(type);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    CollectionReference tasksCollection = fireStore.collection('tasks');
    CollectionReference usersCollection = fireStore.collection('users');
    var taskId = DateTime.now().toIso8601String();
    if (type == 'Add Task') {
      await tasksCollection.doc(taskId).set(
        {
          'title': title,
          'desc': desc,
          'due_date': dueDate,
          'status': '0',
          'total_task': '0',
          'total_task_finished': '0',
          'task_detail': [],
          'asign_to': [authCon.auth.currentUser!.email],
          'created_by': authCon.auth.currentUser!.email,
        },
      ).whenComplete(
        () async {
          await usersCollection.doc(authCon.auth.currentUser!.email).set(
            {
              'task_id': FieldValue.arrayUnion([taskId])
            },
            SetOptions(merge: true),
          );
          Get.back();
          Get.snackbar("$type", "$type Success!");
        },
      ).catchError(
        (error) {
          Get.snackbar("$type", "$type Error!, $type Failed!");
        },
      );
    } else {
      await tasksCollection.doc(docId).update(
        {
          'title': title,
          'desc': desc,
          'due_date': dueDate,
        },
      ).whenComplete(
        () async {
          await usersCollection.doc(authCon.auth.currentUser!.email).set(
            {
              'task_id': FieldValue.arrayUnion([taskId])
            },
            SetOptions(merge: true),
          );
          Get.back();
          Get.snackbar("$type", "$type Success!");
        },
      ).catchError(
        (error) {
          Get.snackbar("$type", "$type Error!, $type Failed!");
        },
      );
    }
  }
}
