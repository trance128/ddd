import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd/presentation/splash/splash_page.dart';

import '../sign_in/sign_in_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SignInPage signInPage;
  SplashPage splashPage;
}