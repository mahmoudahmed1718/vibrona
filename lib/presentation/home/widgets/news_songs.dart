import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';
import 'package:vibrona/presentation/home/bloc/new_song/new_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongsCubit(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: BlocBuilder<NewSongsCubit, NewSongsState>(
          builder: (context, state) {
            if (state is NewSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongsLoaded) {
              return _songs(state.newSongs);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(children: []);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: songs.length,
    );
  }
}
