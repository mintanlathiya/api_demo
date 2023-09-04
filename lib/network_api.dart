import 'package:api_demo/comment_model.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static String commentUrl = 'https://jsonplaceholder.typicode.com/comments';
  static Future<List<Comment>> fetchCommentData() async {
    final response = await http.get(Uri.parse(commentUrl));

    if (response.statusCode == 200) {
      // log(response.body);
      return commentFromJson(response.body);
    } else {
      throw Exception('some error occerd');
    }
  }
}
