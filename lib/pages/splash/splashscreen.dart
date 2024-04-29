import 'dart:async';
import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin()async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? true;

    if(isLogin){
    Timer(const Duration(seconds: 8), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPageWidget()));});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: ExactAssetImage("assets/images/splashscreen.jpg")),
    );
  }
}