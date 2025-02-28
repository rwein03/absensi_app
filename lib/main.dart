import 'package:absensi_app/navigationScreen.dart';
import 'package:absensi_app/pages/loginscreen.dart';
import 'package:absensi_app/provider/usersprovider.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

void main() async {
  String? token = await Auth().getToken();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Usersprovider(),
      )
    ],
    child: MyApp(
      token: token,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (token != null && !JwtDecoder.isExpired(token!))
            ? NavigationPage()
            : LoginPages());
  }
}
