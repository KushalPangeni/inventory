import 'package:inventory/network/response_type_def.dart';

abstract class AuthRepository{
  EitherResponse signIn(String username, String password);
}