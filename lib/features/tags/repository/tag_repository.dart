import 'package:inventory/network/response_type_def.dart';

abstract class TagRepository{
EitherResponse postTags(String tag);
EitherResponse getTags();
EitherResponse editTags();
EitherResponse deleteTags(int tagId);
}