import 'dart:async';
import 'package:modelapp/Core/models/user.dart';
import 'package:modelapp/Core/services/api.dart';
import 'package:modelapp/service_locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}