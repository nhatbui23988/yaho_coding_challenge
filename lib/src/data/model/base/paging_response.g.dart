// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingResponse<T> _$PagingResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagingResponse<T>(
      data: json['data'] == null
          ? null
          : Paging<T>.fromJson(json['data'] as Map<String, dynamic>,
              (value) => fromJsonT(value)),
      rawData: json['rawData'],
    );

Map<String, dynamic> _$PagingResponseToJson<T>(
  PagingResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data,
      'rawData': instance.rawData,
    };

Paging<T> _$PagingFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paging<T>(
      page: json['page'] as int?,
      total: json['total'] as int?,
      totalPages: json['totalPages'] as int?,
      perPage: json['perPage'] as int?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PagingToJson<T>(
  Paging<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data?.map(toJsonT).toList(),
    };
