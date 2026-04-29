import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call({required String postId}) async {
    return await repository.deletePost(postId:postId);
  }
}