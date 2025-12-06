import 'package:dartz/dartz.dart';
import 'package:vibrona/data/models/auth/create_user_req.dart';

abstract class AuthRepo {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
