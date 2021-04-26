import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/core/resources/routes.dart';

import 'card_menu_widget.dart';

class MeetingWidget extends StatefulWidget {
  MeetingWidget({Key key}) : super(key: key);

  @override
  _MeetingWidgetState createState() => _MeetingWidgetState();
}

class _MeetingWidgetState extends State<MeetingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CardMenuWidget(
            image: Image.asset(
              'assets/images/meeting.png',
              width: 22,
            ),
            onTap: () {
              Navigator.pushNamed(context, createNewMeetingRoute);
            },
            title: 'Buat Ruang Meeting',
          ),
          SizedBox(height: 8),
          CardMenuWidget(
            image: Image.asset(
              'assets/images/meeting.png',
              width: 22,
            ),
            onTap: () {},
            title: 'Ikut Meeting',
          ),
        ],
      ),
    );
  }
}
