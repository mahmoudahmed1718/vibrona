import 'package:get_it/get_it.dart';

import 'package:vibrona/data/repostiory/auth/auth_repo_impl.dart';
import 'package:vibrona/data/repostiory/songs/song_repo_impl.dart';
import 'package:vibrona/data/sources/auth/auth_firebase_service.dart';
import 'package:vibrona/data/sources/songs/song_service.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/domain/repostiory/song/song_repo.dart';
import 'package:vibrona/domain/usecases/auth/sign_in_use_case.dart';
import 'package:vibrona/domain/usecases/auth/sign_up_use_case.dart';
import 'package:vibrona/domain/usecases/songs/get_news_song_usecase.dart';
import 'package:vibrona/domain/usecases/songs/get_playlist_song_use_case.dart';

final sl = GetIt.instance;
Future<void> intializeDependencies() async {
  //! Service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  //! Repository
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<SongRepo>(SongRepoImpl());
  //! UseCase
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase());
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  sl.registerSingleton<GetNewsSongUsecase>(GetNewsSongUsecase());
  sl.registerSingleton<GetPlaylistSongUseCase>(GetPlaylistSongUseCase());
}
