import 'package:dartz/dartz.dart';
import 'package:water_meters/core/errors/failure.dart';
import 'package:water_meters/features/subs/domain/entities/subs_entity.dart';

abstract class SubsRepository {
  Future<Either<Failure, SubsEntity>> getSubs();
  Future<Either<Failure, SubsEntity>> deleteSubs(int id);
  Future<Either<Failure, SubsEntity>> updateSubs(SubsEntity subs);
  Future<Either<Failure, SubsEntity>> addSubs(SubsEntity subs);
}
