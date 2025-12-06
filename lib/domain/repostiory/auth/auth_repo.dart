import 'package:vibrona/data/models/auth/create_user_req.dart';

abstract class AuthRepo {
  Future<void> signUp(CreateUserReq createUserReq);
  Future<void> signIn();
}
