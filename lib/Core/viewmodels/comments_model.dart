import '../../service_locator.dart';
import 'package:modelapp/Core/enums/view_state.dart';
import 'package:modelapp/Core/models/comment.dart';
import 'package:modelapp/Core/services/api.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}