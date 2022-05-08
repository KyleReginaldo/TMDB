import 'package:bloc/bloc.dart';
import 'package:damovie/core/constants/error_messsage.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/usecase/search_movies.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchMovies) : super(SearchInitial());

  final SearchMovies _searchMovies;

  void searchMovies({required String query}) async {
    if (query.isEmpty) {
      emit(
        const SearchEmpty(
          msg: EMPTY_MESSAGE,
        ),
      );
    } else {
      emit(SearchLoading());
    }
    final eitherMovieOrError =
        await _searchMovies.call(SearchMovieParams(query: query));
    eitherMovieOrError.fold(
        (l) => emit(
              const SearchError(
                error: SEARCH_ERROR_MESSAGE,
              ),
            ), (results) {
      emit(
        SearchLoaded(
          movies: results,
        ),
      );
    });
  }
}
