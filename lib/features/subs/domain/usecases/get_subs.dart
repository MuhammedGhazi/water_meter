import 'package:dartz/dartz.dart';
import 'package:water_meters/core/errors/failure.dart';
import 'package:water_meters/core/params/params.dart';
import 'package:water_meters/features/subs/domain/entities/subs_entity.dart';
import 'package:water_meters/features/subs/domain/repositories/subs_repository.dart';

class GetSubs {
  final SubsRepository subsRepository;

  GetSubs({required this.subsRepository});
  Future<Either<Failure, SubsEntity>> call({required SubsParams params}) {
    return subsRepository.getSub(params: params);
  }
}
