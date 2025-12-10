import 'package:fpdart/fpdart.dart';
import 'package:untitled/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
