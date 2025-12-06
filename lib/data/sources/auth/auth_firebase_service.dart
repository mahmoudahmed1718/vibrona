import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibrona/data/models/auth/create_user_req.dart';
import 'package:vibrona/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return Right('User signed in successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Left('Wrong password provided for that user.');
      }
      return Left(e.message ?? 'An unknown error occurred');
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Left('The account already exists for that email.');
      }
      return Left(e.message ?? 'An unknown error occurred');
    }
  }
}
