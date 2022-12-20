import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smt5/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  UserCredential? _userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchFriendsController;

  @override
  void onInit() {
    super.onInit();
    searchFriendsController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFriendsController.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // print(googleUser!.email);
    // Once signed in, return the UserCredential
    await auth
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);
    // firebase
    CollectionReference users = fireStore.collection('users');

    final cekUsers = await users.doc(googleUser?.email).get();
    if (!cekUsers.exists) {
      users.doc(googleUser?.email).set(
        {
          "uid": _userCredential!.user!.uid,
          "name": googleUser?.displayName,
          "email": googleUser?.email,
          "photo": googleUser?.photoUrl,
          "created_at": _userCredential!.user!.metadata.creationTime,
          "lastLoginAt":
              _userCredential!.user!.metadata.lastSignInTime.toString(),
          // "list_cart": [],
        },
      ).then(
        (value) async {
          String temp = "";
          try {
            for (var i = 0; i < googleUser!.displayName!.length; i++) {
              temp = temp + googleUser.displayName![i];
              await users.doc(googleUser.email).set({
                'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
              }, SetOptions(merge: true));
            }
          } catch (e) {
            print(e);
          }
        },
      );
    } else {
      users.doc(googleUser?.email).update(
        {
          "lastLoginAt":
              _userCredential!.user!.metadata.lastSignInTime.toString(),
        },
      );
    }
    Get.offAllNamed(Routes.HOME);
  }

  Future logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  var kataCari = [].obs;
  var hasilPencarian = [].obs;
  void searchFriends(String keyword) async {
    CollectionReference users = fireStore.collection('users');
    if (keyword.isNotEmpty) {
      final hasilQuery = await users
          .where('list_cari', arrayContains: keyword.toUpperCase())
          .get();
      if (hasilQuery.docs.isNotEmpty) {
        for (var i = 0; i < hasilQuery.docs.length; i++) {
          kataCari.add(hasilQuery.docs[i].data() as Map<String, dynamic>);
        }
      }

      if (kataCari.isNotEmpty) {
        hasilPencarian.value = [];

        for (var element in kataCari) {
          print(element);
          hasilPencarian.add(element);
        }

        kataCari.clear();
      }
    } else {
      kataCari.value = [];
      hasilPencarian.value = [];
    }
    kataCari.refresh();
    hasilPencarian.refresh();
  }

  void addFriends(String _emailFriends) async {
    CollectionReference friends = fireStore.collection('friends');

    final cekfriends = await friends.doc(auth.currentUser!.email).get();
    // Cek data ada atau tidak

    if (cekfriends.data() == null) {
      await friends.doc(auth.currentUser!.email).set(
        {
          "emailMe": auth.currentUser!.email,
          "emailFriends": [_emailFriends],
        },
      ).whenComplete(
        () => Get.snackbar("Friends", "Friends Successfuly Added "),
      );
    } else {
      await friends.doc(auth.currentUser!.email).set(
        {
          "emailFriends": FieldValue.arrayUnion(
            [_emailFriends],
          )
        },
        SetOptions(merge: true),
      ).whenComplete(
        () => Get.snackbar("Friends", "Friends Successfuly Added "),
      );
    }

    kataCari.clear();
    hasilPencarian.clear();
    searchFriendsController.clear();
    Get.back();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamFriends() {
    return fireStore
        .collection('friends')
        .doc(auth.currentUser!.email)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers(String email) {
    return fireStore.collection('users').doc(email).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPeople() async {
    CollectionReference friendsCollection = fireStore.collection('friends');
    final cekFriends =
        await friendsCollection.doc(auth.currentUser!.email).get();

    var listFriends =
        (cekFriends.data() as Map<String, dynamic>)['emailFriends'] as List;

    var hasil = await fireStore
        .collection('users')
        .where('email', whereNotIn: listFriends)
        .get();

    return hasil;
  }
}
