part of 'play_list_song_cubit.dart';

@immutable
sealed class PlayListSongState {}

final class PlayListSongInitial extends PlayListSongState {}

final class PlayListSongLoading extends PlayListSongState {}

final class PlayListSongLoaded extends PlayListSongState {
  final List<SongEntity> playListSongs;
  PlayListSongLoaded({required this.playListSongs});
}

final class PlayListSongError extends PlayListSongState {
  final String message;
  PlayListSongError({required this.message});
}
