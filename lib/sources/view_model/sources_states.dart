import 'package:news/sources/data/models/sources.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  final List<Sources> sources;

  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  final String errorMessage;

  GetSourcesError(this.errorMessage);
}
