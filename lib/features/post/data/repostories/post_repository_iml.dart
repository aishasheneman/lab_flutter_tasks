import 'dart:io';

import 'package:bader_app_project/core/errors/error_handle.dart';
import 'package:bader_app_project/core/errors/failures.dart';
import 'package:bader_app_project/core/network/network_info.dart';
import 'package:bader_app_project/features/post/data/datasource/post_local_data_source.dart';
import 'package:bader_app_project/features/post/data/datasource/post_remote_data_source.dart';
import 'package:bader_app_project/features/post/data/models/post_model.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImple implements PostRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  
  PostRepositoryImple({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<Either<Failure, Unit>> createPost({required PostEntity post , File? imageFile}) async {
   if (await networkInfo.isConnected) {
      try {
        String? imgUrl;
        if (imageFile != null){
          imgUrl = await remoteDataSource.uploadImageToStorage(imageFile);
        }
        final model = PostModel.fromEntity(post.copyWith(imageUrl: imgUrl));
        await remoteDataSource.createPost(model);
        return Right(unit);
      } on Exception catch (e) {
        return Left(ErrorHandle.handle(e));
      }
    } else {
      return Left(NetworkFailure("لا يوجد اتصال بالانترنت"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost({required String postId})async {
    if (await networkInfo.isConnected) {
      try {
        final posts = await remoteDataSource.readPosts();
      final targetPost = posts.firstWhere((p) => p.id == postId);

      await remoteDataSource.deletePost(postId);

      if (targetPost.imageUrl != null) {
        await remoteDataSource.deleteImageFromStorage(targetPost.imageUrl!);
      }
        return Right(unit);
      } on Exception catch (e) {
        return Left(ErrorHandle.handle(e));
      }
    } else {
      return Left(NetworkFailure("لا يوجد اتصال بالانترنت"));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> readposts({String? type , String? userId , String? sql}) async {
    if (await networkInfo.isConnected) {
    try {
      final result = await remoteDataSource.readPosts(type: type, userId: userId);
      // 2. تصفية البيانات لتخزين آخر 7 أيام فقط في الكاش
      final sevenDaysAgo = DateTime.now().subtract(Duration(days: 7));
      
      final recentPostsForCache = result.where((post) {
        // نتحقق من تاريخ المنشور (تأكد أن createdAt في الموديل نوعه DateTime)
        return post.createdAt!.isAfter(sevenDaysAgo);
      }).toList();

      await localDataSource.cachePosts(recentPostsForCache);
      return Right(result);
    } on Exception catch (e) {
      return Left(ErrorHandle.handle(e ));}
    } else {
      try{
        final localPosts = await localDataSource.getCachedPosts(sql!);
        return Right(localPosts);
      } catch (e){
        return Left(NetworkFailure("لا يوجد اتصال بالانترنت"));
      }
    
    }
    
  }

  @override
  Future<Either<Failure, Unit>> toggleLike({required String postId}) {
    // TODO: implement toggleLike
    throw UnimplementedError();
  }

  
}