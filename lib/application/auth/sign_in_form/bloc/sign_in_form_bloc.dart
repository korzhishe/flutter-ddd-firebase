import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd_course/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessoption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessoption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
       yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessoption: none(),
        );

        

        final failureOrSuccess = await _authFacade.registerWithEmailAndPassword();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessoption: optionOf(failureOrSuccess),
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessoption: none(),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessoption: optionOf(failureOrSuccess),
        );
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessoption: none(),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessoption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
