import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/feature/daftar_sukses/presentation/widget/content_widget.dart';

class DaftarSuksesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContentWidget(),
      ),
    );
  }
}
