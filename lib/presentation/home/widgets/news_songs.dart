import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibrona/core/config/constant/app_urls.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';
import 'package:vibrona/presentation/home/bloc/new_song/new_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongsCubit()..fetchNewSongs(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: BlocBuilder<NewSongsCubit, NewSongsState>(
          builder: (context, state) {
            if (state is NewSongsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewSongsLoaded) {
              return _songs(state.newSongs);
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 180,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${AppUrls.supabaseStorageUrl}${AppUrls.supabaseImagesBucket}${songs[index].artist.trim()}.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              songs[index].title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              songs[index].artist,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10);
      },
      itemCount: songs.length,
    );
  }
}
