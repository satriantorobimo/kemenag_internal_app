import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/function/shared_preff.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pengaturan Akun',
              style: TextStyle(fontSize: 14, color: DSColor.primaryGreen)),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Password',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              Text('Ganti Password',
                  style: TextStyle(fontSize: 14, color: DSColor.primaryGreen)),
            ],
          ),
          SizedBox(height: 24),
          Text('Lainnya',
              style: TextStyle(fontSize: 14, color: DSColor.primaryGreen)),
          SizedBox(height: 18),
          Text('Ketentuan Layanan',
              style: TextStyle(fontSize: 14, color: Colors.black)),
          SizedBox(height: 16),
          Text('Bantuan', style: TextStyle(fontSize: 14, color: Colors.black)),
          SizedBox(height: 16),
          InkWell(
              onTap: () {
                SharedPreff().deleteSharedPref('token');
                Navigator.pushNamedAndRemoveUntil(
                    context, berandaRoute, (route) => false);
              },
              child: Text('Keluar',
                  style: TextStyle(fontSize: 14, color: Colors.black))),
        ],
      ),
    );
  }
}
