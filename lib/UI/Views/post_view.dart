import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modelapp/Core/models/post.dart';
import 'package:modelapp/Core/models/user.dart';
import 'package:modelapp/UI/Shared/app_colors.dart';
import 'package:modelapp/UI/Shared/text_styles.dart';
import 'package:modelapp/UI/Shared/ui_helpers.dart';
import 'package:modelapp/UI/Widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}