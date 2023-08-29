// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'news_api_model.dart';

class NewsApiModel {
  final String status;
  final int totalResults;
  List<Articles> articles;
  NewsApiModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsApiModel copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    return NewsApiModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsApiModel.fromMap(Map<String, dynamic> map) {
    final data = map["articles"] as List<dynamic>;
    return NewsApiModel(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: data
          .map(
            (e) => Articles.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsApiModel.fromJson(String source) =>
      NewsApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewsApiModel(status: $status, totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(covariant NewsApiModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.status == status &&
        other.totalResults == totalResults &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}
