import 'package:authentication_repository/authentication_repository.dart';
import 'package:dashboardflutter/app.dart';
import 'package:flutter/widgets.dart';
import 'package:menu_repository/menu_repository.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
    menuRepository: MenuRepository(),
  ));
}
