import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class AvatarDataUtamaWidget extends StatelessWidget {
  final String urlPhoto;

  const AvatarDataUtamaWidget(this.urlPhoto);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 88.0,
        height: 88.0,
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          image: DecorationImage(
            image: NetworkImage(urlPhoto ??
                'https://kubalubra.is/wp-content/uploads/2017/11/default-thumbnail.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Color(0xFFF0F0F0),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
