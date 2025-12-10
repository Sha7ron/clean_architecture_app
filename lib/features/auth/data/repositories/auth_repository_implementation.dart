import 'package:fpdart/src/either.dart';
import 'package:untitled/core/error/exceptions.dart';
import 'package:untitled/core/error/failure.dart';
import 'package:untitled/features/auth/data/data%20sources/auth_remote_data_source.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) async {
    try{
      final userId = await remoteDataSource.signUpWithEmailPassword(
          name: name,
          email: email,
          password: password
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}