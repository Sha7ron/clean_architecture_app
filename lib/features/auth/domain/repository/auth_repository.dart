import 'package:fpdart/fpdart.dart';
import 'package:untitled/features/auth/domain/entities/user.dart';
import 'package:untitled/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
