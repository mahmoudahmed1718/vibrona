import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return SizedBox();
            } else {
              return const Center(child: Text('Failed to load new songs'));
            }
          },
        ),
      ),
    );
  }
}
