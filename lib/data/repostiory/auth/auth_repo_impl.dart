import 'package:vibrona/data/models/auth/create_user_req.dart';
import 'package:vibrona/data/sources/auth/auth_firebase_service.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/service_lecator.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
