// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:ddd/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ddd/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:ddd/domain/auth/i_auth_facade.dart';
import 'package:ddd/infrastructure/auth/firebase_auth_facade.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final fireBaseInjectableModule = _$FireBaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => fireBaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<GoogleSignIn>(
      () => fireBaseInjectableModule.googleSignIn);
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerLazySingleton<FirebaseAuthFacade>(
      () => FirebaseAuthFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
}

class _$FireBaseInjectableModule extends FireBaseInjectableModule {}
