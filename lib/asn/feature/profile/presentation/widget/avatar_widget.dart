import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

class AvatarWidget extends StatelessWidget {
  final String urlPhoto;

  const AvatarWidget(this.urlPhoto);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 30,
          height: 30,
        ),
        Stack(
          children: <Widget>[
            Container(
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
            // Positioned(
            //     bottom: 1,
            //     right: 1,
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.pushNamed(context, ubahPhotoProfileRoute);
            //       },
            //       child: Container(
            //         height: 30,
            //         width: 30,
            //         child: Icon(
            //           Icons.add_a_photo,
            //           color: Colors.white,
            //           size: 20,
            //         ),
            //         decoration: BoxDecoration(
            //             color: DSColor.primaryGreen,
            //             borderRadius: BorderRadius.all(Radius.circular(20))),
            //       ),
            //     ))
          ],
        ),
        Icon(Icons.qr_code_sharp, size: 30)
      ],
    );
  }
}
