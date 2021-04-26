import 'package:flutter/material.dart';

class HeaderWidgetDaftar extends StatelessWidget {
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
          'Pendaftaran NON ASN',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 16),
        Center(
            child: Text(
          'Silahkan Buat Akun Anda',
          style: TextStyle(color: Colors.white, fontSize: 12),
        )),
      ],
    );
  }
}
