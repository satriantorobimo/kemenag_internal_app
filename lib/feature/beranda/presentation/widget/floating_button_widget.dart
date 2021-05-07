import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/function/shared_preff.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class FloatingButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
          width: 345.0,
          height: 85.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1.5,
                offset: Offset(
                  0.5,
                  0.5,
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    RawMaterialButton(
                      fillColor: DSColor.primaryGreen,
                      shape: CircleBorder(),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/user-white.png',
                          width: 30,
                        ),
                      ),
                      onPressed: () {
                        SharedPreff().getSharedString('token').then((value) {
                          if (value == null) {
                            Navigator.pushNamed(context, loginRoute);
                          } else {
                            Navigator.pushNamed(context, berandaAsnRoute);
                          }
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text('ASN',
                        style: TextStyle(fontSize: 10, color: Colors.black))
                  ],
                ),
                Column(
                  children: [
                    RawMaterialButton(
                      fillColor: DSColor.fourthBlue,
                      shape: CircleBorder(),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/school.png',
                          width: 30,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, loginNonAsnRoute);
                      },
                    ),
                    SizedBox(height: 8),
                    Text('NON ASN',
                        style: TextStyle(fontSize: 10, color: Colors.black))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
