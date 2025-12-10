import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibrona/presentation/home/bloc/play_list_song/play_list_song_cubit.dart';

class PlaylistSong extends StatelessWidget {
  const PlaylistSong({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListSongCubit()..fetchPlayListSongs(),
      child: BlocBuilder<PlayListSongCubit, PlayListSongState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
