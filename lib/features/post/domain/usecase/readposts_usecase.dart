import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class ReadPostsUseCase {
  final PostRepository repository;
  ReadPostsUseCase({ required this.repository});
  Future<Either<Failure, List<PostEntity>>> call({String? type ,String? userId})  {
    return repository.readposts(type: type , userId: userId);
  }
}