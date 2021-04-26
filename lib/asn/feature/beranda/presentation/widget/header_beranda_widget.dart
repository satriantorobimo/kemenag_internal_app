import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class HeaderBerandaAsnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 42),
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ASN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
                      Navigator.pushNamed(context, profilRoute);
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
      ),
    );
  }
}
