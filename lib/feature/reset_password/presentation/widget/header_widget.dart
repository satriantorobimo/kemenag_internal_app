import 'package:flutter/material.dart';

class HeaderWidgetResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 123,
          ),
        ),
        SizedBox(height: 16),
        Center(
            child: Text(
          'Setel Ulang Password',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 16),
        Center(
            child: Text(
          'Masukkan Email Anda Untuk Melakukan Setel Ulang Password',
          style: TextStyle(color: Colors.white, fontSize: 12),
        )),
      ],
    );
  }
}
