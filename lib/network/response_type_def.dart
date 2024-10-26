import 'package:dartz/dartz.dart';

import 'data_response.dart';

typedef EitherResponse<T> = Future<Either<DataResponse<String>, DataResponse<T>>>;