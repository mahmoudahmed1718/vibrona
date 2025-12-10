import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:vibrona/data/models/song/song_model.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlaylistSongs();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    List<SongEntity> songs = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('realsedData', descending: false)
          .limit(4)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left('Error fetching songs: $e');
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getPlaylistSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('songs').get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left('Error fetching playlist songs: $e');
    }
  }
}
