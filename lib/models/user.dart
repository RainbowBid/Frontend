import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String? name;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
