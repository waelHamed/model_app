import 'package:flutter/material.dart';
import 'package:modelapp/Core/enums/view_state.dart';
import 'package:modelapp/Core/viewmodels/login_model.dart';
import 'package:provider/provider.dart';
import 'package:modelapp/service_locator.dart';
import 'package:modelapp/UI/Widgets/login_header.dart';
import 'package:modelapp/UI/Views/base_view.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage, controller: _controller),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if (loginSuccess) {
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}