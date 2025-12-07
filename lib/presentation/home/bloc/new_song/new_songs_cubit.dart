import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_songs_state.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsInitial());
}
