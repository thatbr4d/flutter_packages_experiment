import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '/business/services/service_registration.dart';
import '/ui/viewmodels/user_post_viewmodel.dart';

class UserPostView extends StatelessWidget {
  UserPostView({Key? key}) : super(key: key);

  final model = locator<UserPostViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JsonPlaceholder Form Sample"),
      ),
      body: FutureBuilder<bool>(
        future: model.initialize(),
        builder: ((context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return UserPostDetail();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

class UserPostDetail extends StatelessWidget with GetItMixin {
  UserPostDetail({Key? key}) : super(key: key);

  final model = locator<UserPostViewModel>();

  @override
  Widget build(BuildContext context) {
    final userPost = getX((UserPostViewModel x) => x.userPost);
    final body = watchOnly((UserPostViewModel x) => x.bodyUI);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "User Id: ",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    userPost!.userId.toString(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Post Id: ", style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    userPost!.id.toString(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Title: ", style: Theme.of(context).textTheme.labelLarge),
                  Expanded(
                    child: Text(
                      userPost.title,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Body: ", style: Theme.of(context).textTheme.labelLarge),
                  TextFormField(
                    onChanged: (text) {
                      model.updateBody(text);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: userPost!.body,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Body: ", style: Theme.of(context).textTheme.labelLarge),
                      Expanded(
                        child: Text(
                          body!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
