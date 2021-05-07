import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';

class CardMenuWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Image image;
  final String subTitle;

  const CardMenuWidget(
      {Key key, this.onTap, this.title, this.image, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Card(
          semanticContainer: true,
          elevation: 3,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: DSColor.primaryGreen,
                    border: Border.all(color: DSColor.primaryGreen, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                padding: EdgeInsets.all(8.0),
                child: image,
              ),
              title: Text('$title',
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    width: 8,
                  ),
                  SizedBox(width: 4),
                  Text('$subTitle orang',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      )),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ),
    );
  }
}
