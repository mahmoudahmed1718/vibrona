import 'package:get_it/get_it.dart';
import 'package:vibrona/data/repostiory/auth/auth_repo_impl.dart';
import 'package:vibrona/data/sources/auth/auth_firebase_service.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';

final sl = GetIt.instance;
Future<void> intializeDependencies() async {
  //Service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //Repository
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
}
