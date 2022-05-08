part of 'video_cubit.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class NoVideo extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoEntity> videos;
  VideoLoaded({
    required this.videos,
  });
}
