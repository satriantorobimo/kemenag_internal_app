import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/data/profile_model.dart';

class FormEditProfileWidget extends StatefulWidget {
  final Data data;

  const FormEditProfileWidget(this.data);

  @override
  _FormEditProfileWidgetState createState() => _FormEditProfileWidgetState();
}

class _FormEditProfileWidgetState extends State<FormEditProfileWidget> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _tmptLahirController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    setState(() {
      if (widget.data.name != null) {
        _fullNameController.text = widget.data.name;
      }
      if (widget.data.email != null) {
        _emailController.text = widget.data.email;
      }
      if (widget.data.user_detail.tanggal_lahir != null) {
        DateTime tempDate = DateFormat("yyyy-MM-dd")
            .parse(widget.data.user_detail.tanggal_lahir);
        String date = tanggal(tempDate);
        _tglLahirController.text = date;
      }
      if (widget.data.user_detail.tempat_lahir != null) {
        _tmptLahirController.text = widget.data.user_detail.tempat_lahir;
      }
    });
    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        String date = tanggal(selectedDate);
        _tglLahirController.text = date;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextField(
              autofocus: false,
              controller: _fullNameController,
              cursorColor: DSColor.primaryGreen,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Nama Lengkap'),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextField(
              autofocus: false,
              controller: _emailController,
              cursorColor: DSColor.primaryGreen,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Email'),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextField(
              autofocus: false,
              controller: _tmptLahirController,
              cursorColor: DSColor.primaryGreen,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Tempat Lahir'),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: TextFormField(
                enabled: false,
                autofocus: false,
                controller: _tglLahirController,
                cursorColor: DSColor.primaryGreen,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: 'Tanggal Lahir'),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextFormField(
              maxLines: null,
              controller: _alamatController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Alamat"),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {},
                padding: EdgeInsets.all(12),
                color: DSColor.primaryGreen,
                child: Text('Simpan Perubahan',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
