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
      print(result.user!.uid);
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

  Future<String?> getTitleFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String title = querySnapshot.docs[0].get('title');
        return title;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getCategoryFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String category = querySnapshot.docs[0].get('category');
        return category;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getdescFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String desc = querySnapshot.docs[0].get('description');
        return desc;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getStartDateFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String startTime = querySnapshot.docs[0].get('start_date');
        return startTime;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getEndDateFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String endTime = querySnapshot.docs[0].get('end_date');
        return endTime;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<String?> getTaskStatusUpdateFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String taskStatusUpdate =
            querySnapshot.docs[0].get('task_status_update_on');
        return taskStatusUpdate;
      } else {
        return '';
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return '';
    }
  }

  Future<int?> getisCompletedFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        int isCompleted = querySnapshot.docs[0].get('is_completed');
        return isCompleted;
      } else {
        return null;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return null;
    }
  }

  Future<int> getBoardIdFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        int boardId = querySnapshot.docs[0].get('board_id');
        return boardId;
      } else {
        return 1;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return 1;
    }
  }

  Future<List<String>?> getMyTasksFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        List<String> myTask = querySnapshot.docs[0].get('my_tasks');
        return myTask;
      } else {
        return null;
      }
    } catch (e) {
      print('Veri alınamadı: $e');
      return null;
    }
  }

  Future<String?> getTaskStateFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      if (querySnapshot.docs.isNotEmpty) {
        String taskState = querySnapshot.docs[0].get('task_state');
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
