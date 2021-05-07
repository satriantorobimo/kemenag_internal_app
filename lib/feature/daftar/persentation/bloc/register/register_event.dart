import 'package:equatable/equatable.dart';
import 'package:kemenag_go_internal_app/feature/daftar/data/model/daftar_request_data_model.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class AttempRegister extends RegisterEvent {
  final DaftarRequestDataModel daftarRequestDataModel;

  AttempRegister(this.daftarRequestDataModel);
  @override
  List<Object> get props => [daftarRequestDataModel];
}
