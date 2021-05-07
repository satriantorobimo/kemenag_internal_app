import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/widget/success_absen_widget.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';

class SuccessAbsenScreen extends StatefulWidget {
  final String message;

  const SuccessAbsenScreen(this.message);

  @override
  _SuccessAbsenScreenState createState() => _SuccessAbsenScreenState();
}

class _SuccessAbsenScreenState extends State<SuccessAbsenScreen> {
  @override
  void initState() {
    print(widget.message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.primaryGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SuccessAbsesnWidget(widget.message ?? ''),
      ),
    );
  }
}
