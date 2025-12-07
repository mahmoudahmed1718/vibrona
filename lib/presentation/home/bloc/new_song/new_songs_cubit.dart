import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';
import 'package:vibrona/domain/usecases/songs/get_news_song_usecase.dart';
import 'package:vibrona/service_lecator.dart';

part 'new_songs_state.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsInitial());
  Future<void> fetchNewSongs() async {
    emit(NewSongsLoading());
    var returnIngSongs = await sl<GetNewsSongUsecase>().call();
    returnIngSongs.fold(
      (failure) {
        emit(NewSongsError(message: failure.message));
      },
      (songs) {
        emit(NewSongsLoaded(newSongs: songs));
      },
    );
  }
}
