import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception
{
  final ErrorMessageModel errorMessageModel;

  ServerException(this.errorMessageModel);
}