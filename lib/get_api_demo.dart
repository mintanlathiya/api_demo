import 'package:api_demo/comment_model.dart';
import 'package:api_demo/network_api.dart';
import 'package:flutter/material.dart';

class GetApiDemoUi extends StatefulWidget {
  const GetApiDemoUi({super.key});

  @override
  State<GetApiDemoUi> createState() => _GetApiDemoUiState();
}

class _GetApiDemoUiState extends State<GetApiDemoUi> {
  late Future<List<Comment>> futureCommentData;
  @override
  void initState() {
    NetworkApi.fetchCommentData();
    futureCommentData = NetworkApi.fetchCommentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureCommentData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(snapshot.data![index].postId.toString()),
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].body),
                  trailing: Text(snapshot.data![index].id.toString()),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
