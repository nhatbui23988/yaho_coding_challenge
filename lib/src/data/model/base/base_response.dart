import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final dynamic rawData;
  final T? data;

  BaseResponse({this.data, this.rawData});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      BaseResponse(
        rawData: json,
        data: json['data'] == null ? null : fromJsonT(json['data']),
      );
}

