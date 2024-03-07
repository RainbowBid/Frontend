import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  const RegisterModel({this.name, this.email, this.password});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  final String? name;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
