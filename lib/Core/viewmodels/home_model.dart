import '../../service_locator.dart';
import 'package:modelapp/Core/enums/view_state.dart';
import 'package:modelapp/Core/models/post.dart';
import 'package:modelapp/Core/services/api.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}