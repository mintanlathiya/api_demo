import 'package:api_demo/network_post_api.dart';
import 'package:api_demo/user_req_model.dart';
import 'package:api_demo/user_resp_model.dart';
import 'package:flutter/material.dart';

class PostApiDemo extends StatefulWidget {
  const PostApiDemo({super.key});

  @override
  State<PostApiDemo> createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  Future<UserResponse>? futureUserResp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            children: [
              TextField(controller: titleController),
              const SizedBox(height: 5),
              TextField(controller: bodyController),
              const SizedBox(height: 5),
              TextField(controller: userIdController),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: () {
                  UserReq obj = UserReq(
                      title: titleController.text,
                      body: bodyController.text,
                      userId: int.parse(userIdController.text));
                  NetworkApi.createUser(data: userReqToJson(obj));
                  setState(() {});
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: futureUserResp,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.id.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
