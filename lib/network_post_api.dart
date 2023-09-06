import 'package:api_demo/user_resp_model.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static String userUrl = 'https://jsonplaceholder.typicode.com/posts';
  static Future<UserResponse> createUser({required String data}) async {
    final response = await http.post(
      Uri.parse(userUrl),
      body: data,
    );
    //log(response.body);
    if (response.statusCode == 201) {
      return userResponseFromJson(response.body);
    } else {
      throw Exception('some error occerd');
    }
  }
}
