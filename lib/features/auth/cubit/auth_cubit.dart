import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory/features/auth/model/auth_model.dart';
import 'package:inventory/features/auth/repository/auth_repository.dart';
import 'package:inventory/home_screen.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository repository;

  AuthCubit(this.repository) : super(const AuthState());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> signIn(BuildContext context) async {
    bool isLoggedIn = false;
    emit(state.copyWith(status: const LoadingState()));
    var response = await repository.signIn(userNameController.text, passwordController.text);
    response.fold((l) {
      isLoggedIn = false;
      emit(state.copyWith(status: const ErrorState()));
      log('Sign in === > $l');
    }, (r) {
      isLoggedIn = true;
      log('Get Folders === > ${r.data}');
      AuthResponse authResponse = r.data;
      saveToken(authResponse.result.token!);
      emit(state.copyWith(status: const LoadedState(), authResponse: authResponse));
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
      );
    });
    return isLoggedIn;
  }

  clearTextController() {
    userNameController.clear();
    passwordController.clear();
  }

  saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }
}
