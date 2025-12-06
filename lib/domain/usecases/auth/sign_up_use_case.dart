import 'package:dartz/dartz.dart';
import 'package:vibrona/core/usecase/use_case.dart';
import 'package:vibrona/data/models/auth/create_user_req.dart';

class SignUpUseCase extends UseCase<Either, CreateUserReq> {
  @override
  Future<Either<dynamic, dynamic>> call({CreateUserReq? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
