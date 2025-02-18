// ignore_for_file: use_build_context_synchronously

import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/loginModel.dart';
import 'package:absensi_app/navigationScreen.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:absensi_app/widgets/login/buttonlogin.dart';
import 'package:absensi_app/services/loginService.dart';
import 'package:absensi_app/widgets/login/editLogin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> with TickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AnimationController _controller;

  Future<bool> handleLogin() async {
    Login loginData = Login(
        username: usernameController.value.text.trim(),
        password: passwordController.value.text.trim());
    bool success = await loginUser(loginData);
    if (success) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavigationPage(),
          ));
      return true;
    } else {
      alertDialog(context, "Wrong username or password!");
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
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
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
              height: screenHeight / 2.5,
              width: 350,
              padding: EdgeInsets.all(12),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WELCOME",
                      textAlign: TextAlign.left, style: AppStyle.titleText),
                  Text("Please Sign in!",
                      textAlign: TextAlign.left, style: AppStyle.subTitle),
                  SizedBox(height: 20),
                  EditloginWidget(
                    labelText: 'Username',
                    controller: usernameController,
                    icon: Icons.person_pin,
                  ),
                  SizedBox(height: 20),
                  EditloginWidget(
                    labelText: 'Password',
                    controller: passwordController,
                    icon: Icons.password,
                    isPassword: true,
                  ),
                  buttonLogin(
                    () async {
                      final success = await handleLogin();
                      if (success) {
                        setState(() {});
                      }
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
