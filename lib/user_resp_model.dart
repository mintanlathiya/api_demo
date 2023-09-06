// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

class UserResponse {
  int id;

  UserResponse({
    required this.id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
      );
}
