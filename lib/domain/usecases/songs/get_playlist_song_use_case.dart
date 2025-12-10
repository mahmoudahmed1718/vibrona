import 'package:dartz/dartz.dart';
import 'package:vibrona/core/usecase/use_case.dart';

import 'package:vibrona/domain/repostiory/song/song_repo.dart';
import 'package:vibrona/service_lecator.dart';

class GetPlaylistSongUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either<dynamic, dynamic>> call({params}) async {
    return await sl<SongRepo>().getPlaylistSongs();
  }
}
