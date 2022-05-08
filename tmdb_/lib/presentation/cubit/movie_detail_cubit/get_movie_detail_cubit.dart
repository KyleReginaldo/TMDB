import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';

import '../../../domain/entity/movie_detail.dart';
import '../../../domain/usecase/get_movie_detail.dart';

part 'get_movie_detail_state.dart';

class GetMovieDetailCubit extends Cubit<GetMovieDetailState> {
  GetMovieDetailCubit({
    required this.getMovieDetails,
    required this.video,
  }) : super(GetMovieDetailInitial());

  final GetMovieDetail getMovieDetails;
  final VideoCubit video;

  void getMovieDetail({required int id}) async {
    emit(GetMovieDetailLoading());
    final eitherDetailOrError = await getMovieDetails(
      MovieDetailParams(id: id),
    );
    eitherDetailOrError.fold(
        (l) => emit(
              GetMovieDetailError(error: 'error'),
            ),
        (detail) => emit(
              GetMovieDetailLoaded(movieDetail: detail),
            ));

    video.getVideo(id);
  }
}
