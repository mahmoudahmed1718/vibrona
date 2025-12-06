import 'package:dartz/dartz.dart';
import 'package:vibrona/data/models/auth/create_user_req.dart';
import 'package:vibrona/data/models/auth/signin_user_req.dart';
import 'package:vibrona/data/sources/auth/auth_firebase_service.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/service_lecator.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
