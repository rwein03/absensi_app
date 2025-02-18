import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/loginModel.dart';
import 'package:absensi_app/pages/dashboard.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:absensi_app/widgets/login/buttonlogin.dart';
import 'package:logger/logger.dart';
import 'package:absensi_app/services/loginService.dart';
import 'package:absensi_app/widgets/login/editLogin.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var logger = Logger();

  Future<bool> handleLogin() async {
    Login loginData = Login(
        username: usernameController.value.text.trim(),
        password: passwordController.value.text.trim());
    bool success = await loginUser(loginData);
    if (success) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homeScreen(),
          ));
      return true;
    } else {
      alertDialog(context, "Wrong username or password!");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight / 3,
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
    );
  }
}
