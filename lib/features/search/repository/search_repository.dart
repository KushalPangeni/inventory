import 'package:inventory/network/response_type_def.dart';

abstract class SearchRepository{
 EitherResponse searchByString(String text);
}