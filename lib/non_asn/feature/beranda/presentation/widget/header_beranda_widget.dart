import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class HeaderBerandaNonAsnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 23,
                ),
                SizedBox(width: 8),
                Text(
                  'Kementerian Agama',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/phone.png',
                  width: 16,
                ),
                SizedBox(width: 12),
                Image.asset(
                  'assets/images/notif.png',
                  width: 16,
                ),
                SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, profilNonAsnRoute);
                  },
                  child: Image.asset(
                    'assets/images/user-white.png',
                    width: 16,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
