import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vibrona/domain/entites/songs/song_entity.dart';
import 'package:vibrona/presentation/home/bloc/new_song/new_songs_cubit.dart';
import 'package:vibrona/presentation/home/widgets/new_song_item.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongsCubit()..fetchNewSongs(),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.15,
        child: BlocBuilder<NewSongsCubit, NewSongsState>(
          builder: (context, state) {
            if (state is NewSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongsLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _songs(state.newSongs),
              );
            } else {
              return Text('Error: .message');
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
        return NewSongItem(songs: songs[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: songs.length,
    );
  }
}
