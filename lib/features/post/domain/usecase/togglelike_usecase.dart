import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class ToggleLikeUseCase {
  final PostRepository repository;

  ToggleLikeUseCase(this.repository);

  Future<Either<Failure, Unit>> call({required String postId}) async {
    return await repository.toggleLike(postId:postId);
  }
}