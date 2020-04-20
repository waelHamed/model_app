import 'package:modelapp/Core/services/authentication_service.dart';
import 'package:modelapp/service_locator.dart';
import 'package:modelapp/Core/enums/view_state.dart';
import 'base_model.dart';


class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if(userId == null) {
      errorMessage = 'Not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);


    setState(ViewState.Idle);
    return success;
  }
}