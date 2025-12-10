import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';
import 'package:vibrona/domain/usecases/songs/get_playlist_song_use_case.dart';
import 'package:vibrona/service_lecator.dart';

part 'play_list_song_state.dart';

class PlayListSongCubit extends Cubit<PlayListSongState> {
  PlayListSongCubit() : super(PlayListSongInitial());
  Future<void> fetchPlayListSongs() async {
    emit(PlayListSongLoading());
    var returningSongs = await sl<GetPlaylistSongUseCase>().call();
    returningSongs.fold(
      (failure) {
        emit(PlayListSongError(message: failure.message));
      },
      (songs) {
        emit(PlayListSongLoaded(playListSongs: songs));
      },
    );
  }
}
