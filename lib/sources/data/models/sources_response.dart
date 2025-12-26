import 'package:news/sources/data/models/sources.dart';

class SourcesResponse {
  final String? status;
  final List<Sources>? sources;

  SourcesResponse.fromJson(Map<String, dynamic> json)
    : status = json['status'],
      sources = json['sources'] == null
          ? null
          : List<Sources>.from(json['sources'].map((v) => Sources.fromJson(v)));
}
