import 'dart:io';
import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, Unit>> createPost({required PostEntity post , File? imageFile});
  Future<Either<Failure, List<PostEntity>>> readposts({String? type, String? userId , String? sql});
  Future<Either<Failure, Unit>> deletePost({required String postId});
  Future<Either<Failure, Unit>> toggleLike({required String postId});
}