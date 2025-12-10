import 'package:fpdart/fpdart.dart';
import 'package:untitled/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params Params);
}