


import 'package:json_annotation/json_annotation.dart';

part 'user_information.g.dart';

@JsonSerializable()
class UserInformation {
  final int? id;
  final String? email;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  final String? avatar;

  const UserInformation({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserInformation.fromJson(Map<String, dynamic> json) => _$UserInformationFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserInformationToJson(this);

  String toName(){
    return "$firstName $lastName";
  }
}

class LoadingMore extends UserInformation{

}