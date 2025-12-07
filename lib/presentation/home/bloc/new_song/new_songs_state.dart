part of 'new_songs_cubit.dart';

@immutable
sealed class NewSongsState {}

final class NewSongsInitial extends NewSongsState {}

final class NewSongsLoading extends NewSongsState {}

final class NewSongsLoaded extends NewSongsState {
  final List<SongEntity> newSongs;

  NewSongsLoaded({required this.newSongs});
}

final class NewSongsError extends NewSongsState {
  final String message;

  NewSongsError({required this.message});
}
