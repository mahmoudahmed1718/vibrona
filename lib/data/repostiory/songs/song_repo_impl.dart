import 'package:dartz/dartz.dart';
import 'package:vibrona/data/sources/songs/song_service.dart';
import 'package:vibrona/domain/repostiory/song/song_repo.dart';
import 'package:vibrona/service_lecator.dart';

class SongRepoImpl extends SongRepo {
  @override
  Future<Either<dynamic, dynamic>> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either<dynamic, dynamic>> getPlaylistSongs() {
    // TODO: implement getPlaylistSongs
    throw UnimplementedError();
  }
}
