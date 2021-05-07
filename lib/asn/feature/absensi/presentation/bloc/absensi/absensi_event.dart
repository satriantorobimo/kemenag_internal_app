import 'package:equatable/equatable.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';

abstract class AbsensiEvent extends Equatable {
  const AbsensiEvent();

  @override
  List<Object> get props => [];
}

class GetAbsensiToday extends AbsensiEvent {
  @override
  List<Object> get props => [];
}

class GetAbsensiMonth extends AbsensiEvent {
  @override
  List<Object> get props => [];
}

class AttemptAbsensi extends AbsensiEvent {
  final ArgumentAbsenModel argumentAbsenModel;

  AttemptAbsensi(this.argumentAbsenModel);
  @override
  List<Object> get props => [argumentAbsenModel];
}
