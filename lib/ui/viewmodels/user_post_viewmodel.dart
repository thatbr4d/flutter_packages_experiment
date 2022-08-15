import 'package:flutter/foundation.dart';
import '/business/interfaces/i_api_service.dart';
import '/business/models/user_post.dart';
import '/business/services/service_registration.dart';

class UserPostViewModel extends ChangeNotifier {
  final IApiService _api = locator<IApiService>();

  UserPost? userPost;

  String? bodyUI;

  Future<bool> initialize() async {
    try {
      userPost = await _api.fetchFirstPost();
      bodyUI = userPost!.body;
    } on Exception catch (_, e) {
      return false;
    }

    return true;
  }

  void updateBody(String body) {
    userPost!.body = bodyUI = body;

    notifyListeners();
  }
}
