import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  late final SourcesDataSource repository;
  SourcesViewModel() : super(SourcesInitial()) {
    repository = ServiceLocator.sourcesDataSource;
  }
  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}
