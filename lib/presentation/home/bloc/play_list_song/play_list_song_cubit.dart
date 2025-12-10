import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';

part 'play_list_song_state.dart';

class PlayListSongCubit extends Cubit<PlayListSongState> {
  PlayListSongCubit() : super(PlayListSongInitial());
}
