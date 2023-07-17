import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:yourself_in_time_project/common/constants/colors_constants.dart';
import 'package:yourself_in_time_project/ui/login/login_view_model.dart';
import 'package:yourself_in_time_project/ui/register/register_view_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final TextEditingController verificationCodeController =
      TextEditingController();

  Future signInAnonymous() async {
    try {
      final result = await _auth.signInAnonymously();

      return result.user;
    } catch (e) {
      print("Anon error $e");
      return null;
    }
  }

  Future<User?> signIn(String email, String password, LoginViewModel model,
      BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      showStyledSnackBar(
          'You are Logged in', context, AnimatedSnackBarType.success);
      if (userCredential.user != null) {
        model.init();
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showStyledSnackBar("No User Found with this Email'", context,
            AnimatedSnackBarType.error);
      } else if (e.code == 'wrong-password') {
        showStyledSnackBar(
            'Password did not match', context, AnimatedSnackBarType.error);
      } else {
        showStyledSnackBar(
            'An error occurred', context, AnimatedSnackBarType.error);
      }
    }
    return null;
  }

  Future<String?> getTitleFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String title = querySnapshot.docs[index].get('title');
        return title;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<void> updatedTaskCompletionStatus(int index, bool isCompleted) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs[index].id;
        await _firestore
            .collection('tasks')
            .doc(docId)
            .update({'is_completed': isCompleted});
      }
    } catch (e) {
      print('Veri alınamadı: $e');
    }
  }

  Future<void> deleteTaskCompletionStatus(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs[index].id;
        await _firestore.collection('tasks').doc(docId).delete();
      }
    } catch (e) {
      print('Veri alınamadı: $e');
    }
  }

  Future<void> updateddTaskCompletionStatus(
      int index, List<bool> isCompleted) async {
    // asdasda
    try {
      print(isCompleted);
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs[index].id;
        for (var i = 0; i < isCompleted.length; i++) {
          await _firestore
              .collection('tasks')
              .doc(docId)
              .update({'is_task_complete': isCompleted});
        }
      }
    } catch (e) {
      print('Veri alınamadı: $e');
    }
  }

  Future<List<bool>?> getTitleisTaskComplete(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      List<String> myTasks = [];
      List<bool> boolList = [];
      if (querySnapshot.docs.isNotEmpty) {
        var list = querySnapshot.docs[index].get('is_task_complete');
        for (var el in list) {
          myTasks.add(el.toString());
        }
        for (var element in myTasks) {
          bool boolValue = (element == "true") ? true : false;
          boolList.add(boolValue);
        }

        return boolList;
      } else {
        return null;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return null;
    }
  }

  Future<String?> getCategoryFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      List<DocumentSnapshot<Map<String, dynamic>>> documents =
          querySnapshot.docs.cast<DocumentSnapshot<Map<String, dynamic>>>();

      if (documents.isNotEmpty) {
        if (index >= 0 && index < documents.length) {
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              documents[index];
          Map<String, dynamic>? data = documentSnapshot.data();
          if (data!.containsKey('category')) {
            String category = data['category'];
            return category;
          }
        }
      }
      return null; // Koleksiyonda belge yoksa veya belge indeksi geçersizse null döndürüyoruz.
    } catch (e) {
      print('Veri alınamadı: $e');
      return null; // Hata durumunda null döndürüyoruz.
    }
  }

  Future<String?> getdescFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String desc = querySnapshot.docs[index].get('description');
        return desc;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getStartDateFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String startTime = querySnapshot.docs[index].get('start_date');
        return startTime;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getEndDateFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String endTime = querySnapshot.docs[index].get('end_date');
        return endTime;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getTaskStatusUpdateFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String taskStatusUpdate =
            querySnapshot.docs[index].get('task_status_update_on');
        return taskStatusUpdate;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<bool?> getisCompletedFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        bool isCompleted = querySnapshot.docs[index].get('is_completed');
        return isCompleted;
      } else {
        return null;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return null;
    }
  }

  Future<int> getBoardIdFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        int boardId = querySnapshot.docs[index].get('board_id');
        return boardId;
      } else {
        return 1;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return 1;
    }
  }

  Future<List<String>?> getMyTasksFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();
      List<String> myTasks = [];
      if (querySnapshot.docs.isNotEmpty) {
        var list = querySnapshot.docs[index].get('my_task');
        for (var el in list) {
          myTasks.add(el.toString());
        }

        return myTasks;
      } else {
        return null;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return null;
    }
  }

  Future<String> getUserName() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);

    DocumentSnapshot snapshot = await userRef.get();

    // Kullanıcının adını döndürün

    return snapshot.get('name');
  }

  Future<String?> getTaskStateFromFirestore(int index) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String taskState = querySnapshot.docs[index].get('task_state');
        return taskState;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    QuerySnapshot querySnapshot = await _firestore.collection("tasks").get();
    List<Map<String, dynamic>> tasks = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      tasks.add(data);
    });
    return tasks;
  }

  Future<int> getTasksLength() async {
    // bu bize tm hespini dönderir düzelt
    QuerySnapshot querySnapshot = await _firestore.collection("tasks").get();
    int length = querySnapshot.docs.length;
    return length.toInt();
  }

  Future<void> taskAdd(
      String? title,
      String? taskState,
      List<String>? myTasks,
      String? desc,
      DateTime? startDate,
      DateTime? endDate,
      String? category,
      int? isCompleted,
      BuildContext context) async {
    try {
      await _firestore.collection('tasks').add({
        'title': title,
        'task_state': taskState,
        'my_tasks': myTasks,
        'description': desc,
        'start_date': startDate,
        'end_date': endDate,
        'category': category
      });
      showStyledSnackBar(
        "Data Added Successfully",
        context,
        AnimatedSnackBarType.success,
      );
    } catch (e) {
      showStyledSnackBar(
        "Error loading data!",
        context,
        AnimatedSnackBarType.error,
      );
    }
  }

  Future<String> getTitleForUser(String userId) async {
    String title = '';

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('tasks')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        title = querySnapshot.docs[0].get('title') as String;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
    }

    return title;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      final String email = user!.email!;
      final String displayname = user.displayName!;
      final DateTime lastLoginTime = user.metadata.lastSignInTime!;
      final String password = "";
      await _firestore.collection('users').doc(user.uid).set({
        'email': email,
        'last_login_time': lastLoginTime,
        'name': displayname,
        'password': password
      });

      return user;
    } catch (error) {
      print('Google Sign-In Hatası: $error');
      return null;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      showStyledSnackBar(
        "Lütfen Emailinizi kontrol ediniz!",
        context,
        AnimatedSnackBarType.info,
      );
    } catch (e) {}
  }

  Future<User?> createPerson(String name, String email, String password,
      BuildContext context, RegisterViewModel model) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        try {
          final DateTime lastLoginTime = user.metadata.lastSignInTime!;
          isEmailVerified = _auth.currentUser!.emailVerified;
          if (!isEmailVerified) {
            sendVerificationEmail();
            showStyledSnackBar(
              "Onay email e gönderildi ",
              context,
              AnimatedSnackBarType.success,
            );
            Timer.periodic(Duration(seconds: 1), (_) async {
              try {
                await _auth.currentUser!.reload();

                isEmailVerified = _auth.currentUser!.emailVerified;

                if (isEmailVerified) {
                  timer?.cancel();
                  await _firestore.collection('users').doc(user.uid).set(
                      {'email': email, 'name': name, 'password': password});
                  model.init();
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return Center(
                        child: Container(
                          color: ColorConstants
                              .greyColorShade, // Set the desired background color
                          padding: EdgeInsets.all(16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Lottie.asset("assets/json/loading.json",
                                  fit: BoxFit.cover, height: 50, width: 80),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } catch (e) {
                signOut();
              }
            });
          } else {
            showStyledSnackBar(
              "Onay Emaili gönderilemedi ",
              context,
              AnimatedSnackBarType.error,
            );
          }
        } catch (e) {
          showStyledSnackBar(
            "Doğrulama başarısız oldu: $e",
            context,
            AnimatedSnackBarType.warning,
          );
        }
      } else {
        showStyledSnackBar(
            "Bir hata oluştu!!!", context, AnimatedSnackBarType.error);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showStyledSnackBar(
          "E-posta zaten kullanımda",
          context,
          AnimatedSnackBarType.warning,
        );
      } else {
        showStyledSnackBar(
          "Bir hata oluştu",
          context,
          AnimatedSnackBarType.error,
        );
      }
    }
    return null;
  }

  Future sendVerificationEmail() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {}
  }

  void showStyledSnackBar(
      String message, BuildContext context, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(message,
            type: type,
            mobilePositionSettings:
                const MobilePositionSettings(topOnAppearance: 30))
        .show(context);
  }
}
