

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'paging_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingResponse<T> {
  const PagingResponse({
    this.data,
    this.rawData,
  });

  final Paging<T>? data;
  final dynamic rawData;

  factory PagingResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      PagingResponse(
          rawData: json,
          data: Paging.fromJson(json, fromJsonT));
}

@JsonSerializable(genericArgumentFactories: true)
class Paging<T> {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<T>? data;

  const Paging({
    this.page,
    this.total,
    this.totalPages,
    this.perPage,
    this.data,
  });

  factory Paging.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      Paging(
          page: json["page"] as int?,
          total: json["total"] as int?,
          perPage: json["per_page"] as int?,
          totalPages: json["total_pages"] as int?,
          data: json['data'] != null
              ? List.from((json['data']).map((e) => fromJsonT(e)))
              : []);

  Paging copyWith({
    int? page,
    int? totalPages,
    int? perPage,
    List<T>? data,
  }) {
    return Paging(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      perPage: perPage ?? this.perPage,
      data: data ?? this.data,
    );
  }
}