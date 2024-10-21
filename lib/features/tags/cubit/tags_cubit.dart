import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags_state.dart';
part 'tags_cubit.freezed.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit() : super(const TagsState());


}
