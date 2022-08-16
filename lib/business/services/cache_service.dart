import 'dart:io';

import 'package:stash/stash_api.dart';
import 'package:stash_file/stash_file.dart';

import '/business/models/user_post.dart';

class CacheService {
  late final FileVaultStore store;
  late final Vault<UserPost> userPostVault;

  Future<void> initialize() async {
    final path = Directory.systemTemp.path;
    store = await newFileLocalVaultStore(path: path);

    userPostVault = await store.vault<UserPost>(name: 'UserPostVault', fromEncodable: (json) => UserPost.fromJson(json));
  }

  Future<void> addUserPost(UserPost post) async {
    return await userPostVault.put("UserPost", post);
  }

  Future<UserPost?> getUserPost() async {
    return await userPostVault.get("UserPost");
  }
}
