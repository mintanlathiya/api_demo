// To parse this JSON data, do
//
//     final userReq = userReqFromJson(jsonString);

import 'dart:convert';

String userReqToJson(UserReq data) => json.encode(data.toJson());

class UserReq {
  String title;
  String body;
  int userId;

  UserReq({
    required this.title,
    required this.body,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}
