import 'package:dartz/dartz.dart';
import 'package:vibrona/core/usecase/use_case.dart';
import 'package:vibrona/data/models/auth/create_user_req.dart';
import 'package:vibrona/domain/repostiory/auth/auth_repo.dart';
import 'package:vibrona/service_lecator.dart';

class SignUpUseCase extends UseCase<Either, CreateUserReq> {
  @override
  Future<Either<dynamic, dynamic>> call({CreateUserReq? params}) {
    return sl<AuthRepo>().signUp(params!);
  }
}
