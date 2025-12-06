import 'package:dartz/dartz.dart';
import 'package:vibrona/core/usecase/use_case.dart';
import 'package:vibrona/data/models/auth/signin_user_req.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/service_lecator.dart';

class SignInUseCase extends UseCase<Either, SigninUserReq> {
  @override
  Future<Either<dynamic, dynamic>> call({SigninUserReq? params}) {
    return sl<AuthRepo>().signIn(params!);
  }
}
