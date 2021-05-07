import 'package:kemenag_go_internal_app/asn/feature/forum/data/upload_response_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/domain/api/upload_api.dart';

class UploadRepository {
  UploadApiClient uploadApiClient = UploadApiClient();

  Future<UploadFileResponse> uploadFile(String fileName) =>
      uploadApiClient.uploadFile(fileName);
}
