// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:notes_firebase_ddd_course/infrastructure/core/firebase_injectable_modle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_firebase_ddd_course/infrastructure/auth/firebase_auth_facade.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd_course/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<FirebaseAuth>(() => registerModule.firebaseAuth);
  g.registerLazySingleton<GoogleSignIn>(() => registerModule.googleSignIn);
  g.registerFactory<IAuthFacade>(
      () => FireBaseFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
}

class _$RegisterModule extends RegisterModule {}
