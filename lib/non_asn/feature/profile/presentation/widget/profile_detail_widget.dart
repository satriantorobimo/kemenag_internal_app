import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/data/profile_model.dart';

class ProfileNonAsnDetailWidget extends StatelessWidget {
  final Data data;

  const ProfileNonAsnDetailWidget(this.data);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          child: Card(
            elevation: 0,
            color: Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIK',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('1234567890',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Email',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(data.email,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('No Handphone',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                      data.user_detail == null
                          ? '-'
                          : data.user_detail.nomor_hp,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Tempat Lahir',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                      data.user_detail == null
                          ? '-'
                          : data.user_detail.tempat_lahir,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Tanggal Lahir',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                      data.user_detail == null
                          ? '-'
                          : data.user_detail.tanggal_lahir,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Alamat',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(
                      'Jalan Merdeka Timur No 1, Kecamatan, Kelurahan, Kota, Provinsi, Kode Pos',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
