import 'dart:io';
import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePostUseCase {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call({required PostEntity post ,File? imageFile}) async {
    return await repository.createPost(post:post , imageFile: imageFile);
  }
}