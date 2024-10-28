import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/auth/repository/auth_repository.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository repository;

  AuthCubit(this.repository) : super(const AuthState());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 Future<bool> signIn() async {
    emit(state.copyWith(status: const LoadingState()));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', userNameController.text);
    await preferences.setString('password', passwordController.text);
    emit(state.copyWith(status: const LoadedState()));

   return true;

    // String username = preferences.getString('username') ?? '';
    // String password = preferences.getString('password') ?? '';
    /*var response = await repository.signIn(state.userName, state.password);
    response.fold((l) {
      emit(state.copyWith(status: const ErrorState()));
      log('Sign in === > $l');
    }, (r) {
      log('Get Folders === > ${r.data}');
      emit(state.copyWith(status: const LoadedState()));
    });*/
  }

  clearTextController(){
    userNameController.clear();
    passwordController.clear();
  }
}
