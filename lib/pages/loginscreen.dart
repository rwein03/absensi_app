// ignore_for_file: use_build_context_synchronously

import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/loginModel.dart';
import 'package:absensi_app/navigationScreen.dart';
import 'package:absensi_app/provider/classesprovider.dart';
import 'package:absensi_app/provider/usersprovider.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:absensi_app/widgets/login/buttonlogin.dart';
import 'package:absensi_app/services/loginService.dart';
import 'package:absensi_app/widgets/login/editLogin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> with TickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AnimationController _controller;

  bool isloading = false;

  Future<bool> handleLogin() async {
    isloading == true;
    Login loginData = Login(
        username: usernameController.value.text.trim(),
        password: passwordController.value.text.trim());
    bool success = await APIlogin().loginUser(loginData);
    if (success) {
      final userProvider = Provider.of<Usersprovider>(context, listen: false);
      final classesprovider =
          Provider.of<Classesprovider>(context, listen: false);
      await userProvider.fetchUsers(context);
      await classesprovider.fetchClasses(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavigationPage(),
          ));
      return true;
    } else {
      alertDialog(context, "Error", "Wrong username or password!",
          QuickAlertType.error);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              width: 350,
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 20,
                    color: Colors.grey.shade400,
                  )
                ],
              ),
              child: Column(
                spacing: 15,
                mainAxisSize: (MainAxisSize.min),
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WELCOME",
                      textAlign: TextAlign.left, style: AppStyle.titleText),
                  Text("Please Sign in!",
                      textAlign: TextAlign.left, style: AppStyle.subTitle),
                  EditloginWidget(
                    labelText: 'Username',
                    controller: usernameController,
                    icon: Icons.person_pin,
                  ),
                  EditloginWidget(
                    labelText: 'Password',
                    controller: passwordController,
                    icon: Icons.password,
                    isPassword: true,
                  ),
                  isloading
                      ? Center(
                          child: CircularProgressIndicator(
                              // padding: EdgeInsets.only(top: 30),
                              ),
                        )
                      : buttonLogin(
                          () async {
                            setState(() {
                              isloading = true; // Show loading indicator
                            });
                            await handleLogin();
                            setState(() {
                              isloading = false; // Hide loading indicator
                            });
                          },
                        )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 5.5 - 0.2,
            child: Lottie.asset(
              width: 200,
              height: 200,
              'lib/assets/loginAnimation.json',
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
