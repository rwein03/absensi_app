import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/login.dart';
import 'package:absensi_app/pages/buttonlogin.dart';
import 'package:absensi_app/services/login.dart';
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

  void handleLogin() async {
    Login loginData = Login(
        username: usernameController.text, password: passwordController.text);
    bool success = await loginUser(loginData);
    if (success) {
      print("Login successful!");
    } else {
      print("Login failed. Check credentials.");
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
                () => handleLogin(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
