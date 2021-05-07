import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/core/design_system/colors.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:documents_picker/documents_picker.dart';

class CreateNewMeetingScreen extends StatefulWidget {
  @override
  _CreateNewMeetingScreenState createState() => _CreateNewMeetingScreenState();
}

class _CreateNewMeetingScreenState extends State<CreateNewMeetingScreen> {
  TextEditingController nameMeetingController = TextEditingController();
  TextEditingController komentarController = TextEditingController();
  TextEditingController pwdMeetingController = TextEditingController();
  TextEditingController pesertaMeetingController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeEndController = TextEditingController();

  String _setTime, _setDate, _setEndTime;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  List<String> docPaths;

  void _getDocuments() async {
    docPaths = await DocumentsPicker.pickDocuments;
    print(docPaths.length);

    if (!mounted) return;
    setState(() {});
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
        _dateController.text =
            DateFormat(('dd MMMM yyyy')).format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn]).toString();
      });
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeEndController.text = _time;
        _timeEndController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat(('dd MMMM yyyy')).format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn]).toString();
    _timeEndController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour + 1, DateTime.now().minute),
        [hh, ':', nn]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        titleSpacing: 0,
        title: Text(
          'Buat Ruang Meeting',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  autofocus: false,
                  controller: nameMeetingController,
                  cursorColor: DSColor.primaryGreen,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Nama Ruang Meeting',
                      hintText: 'Meeting Bulanan Pendidikan'),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  maxLines: null,
                  controller: komentarController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: "Tulis Komentar Anda",
                    hintText: "Tulis Komentar Anda",
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  autofocus: false,
                  controller: pwdMeetingController,
                  cursorColor: DSColor.primaryGreen,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Password Join Meeting',
                      hintText: '123456789'),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: 125,
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        controller: _dateController,
                        cursorColor: DSColor.primaryGreen,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Tanggal',
                            hintText: '10 Januari 2021'),
                        onSaved: (String val) {
                          _setDate = val;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.only(left: 5.0, right: 4.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                        enabled: false,
                        autofocus: false,
                        controller: _timeController,
                        cursorColor: DSColor.primaryGreen,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Waktu Mulai',
                            hintText: '10:00'),
                        onSaved: (String val) {
                          _setTime = val;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      _selectEndTime(context);
                    },
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.only(left: 5.0, right: 4.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                        onSaved: (String val) {
                          _setEndTime = val;
                        },
                        autofocus: false,
                        enabled: false,
                        controller: _timeEndController,
                        cursorColor: DSColor.primaryGreen,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Waktu Akhir',
                            hintText: '10:00'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  maxLines: null,
                  controller: pesertaMeetingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: "Peserta Meeting",
                    hintText: "Peserta Meeting",
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: _getDocuments,
                child: Container(
                    height: 40,
                    width: 145,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Pilih file undangan',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 16),
              if (docPaths != null)
                if (docPaths.length != 0)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9).withOpacity(0.6),
                      border: Border.all(
                        width: 1,
                        color: Colors.black26,
                      ),
                    ),
                    height: 36,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.attach_file_outlined,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(docPaths.join('\n')),
                            ],
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Hapus',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              SizedBox(height: 16),
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
                    child: Text('Buat Meeting',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
