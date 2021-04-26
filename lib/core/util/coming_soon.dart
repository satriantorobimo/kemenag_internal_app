import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/coming_soon.jpg'),
          SizedBox(height: 24),
          Text('Kami mohon maaf, layanan ini belum tersedia',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
