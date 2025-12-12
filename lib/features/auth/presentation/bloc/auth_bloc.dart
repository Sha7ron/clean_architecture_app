import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/auth/domain/entities/user.dart';
import 'package:untitled/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignup,
  }) : _userSignUp = userSignup,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp(
          UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
      ));

      res.fold(
              (failure) => emit(AuthFailure(failure.message)), // failure
              (user) {
                emit(AuthSuccess(user));
              }, // success
      );

    });
  }
}
