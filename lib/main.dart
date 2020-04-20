import 'package:flutter/material.dart';
import 'package:modelapp/service_locator.dart';
import 'package:provider/provider.dart';
import 'Core/models/user.dart';
import './Core/services/authentication_service.dart';
import 'package:modelapp/UI/route.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
