import 'package:bloc/bloc.dart';
import 'package:damovie/domain/entity/video_entity.dart';
import 'package:damovie/domain/usecase/get_video.dart';
import 'package:equatable/equatable.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this._getVideo) : super(VideoInitial());

  final GetVideo _getVideo;

  void getVideo(int id) async {
    final eitherVideoOrError = await _getVideo(VideoParams(id));
    emit(eitherVideoOrError.fold(
        (l) => NoVideo(), (videos) => VideoLoaded(videos: videos)));
  }
}
