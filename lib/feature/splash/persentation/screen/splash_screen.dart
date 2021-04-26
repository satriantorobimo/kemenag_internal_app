import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/function/shared_preff.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loadingData();
    super.initState();
  }

  _loadingData() {
    Timer(Duration(seconds: 2), () {
      SharedPreff().getSharedString('token').then((value) {
        if (value == null) {
          Navigator.pushNamed(context, berandaRoute);
        } else {
          Navigator.pushNamed(context, berandaAsnRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 175,
              ),
            ),
          ),
          SizedBox(height: 24),
          // Center(
          //     child: Text(
          //   'Internal Aplikasi',
          //   style: TextStyle(color: Colors.white, fontSize: 24),
          // )),
        ],
      ),
    );
  }
}
