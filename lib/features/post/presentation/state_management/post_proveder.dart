import 'dart:io';

import 'package:bader_app_project/features/post/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/domain/usecase/createpost_usecase.dart';
import 'package:bader_app_project/features/post/domain/usecase/readposts_usecase.dart';
import 'package:bader_app_project/features/post/domain/usecase/deletepost_usecase.dart'; // تأكد من وجود المسار

class PostProvider extends ChangeNotifier {
  final ReadPostsUseCase readPostsUseCase;
  final CreatePostUseCase createPostUseCase;
  final DeletePostUseCase deletePostUseCase;

  PostProvider({
    required this.readPostsUseCase,
    required this.createPostUseCase,
    required this.deletePostUseCase,
  });

  List<PostEntity> _posts = [];
  bool _isLoading = false;
  String? _failureMessage;

  // Getters
  List<PostEntity> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get failureMessage => _failureMessage;

  // 1. جلب كافة المنشورات
  Future<void> getAllPosts({String? type , String? userId}) async {
    _setLoading(true);
    final result = await readPostsUseCase.call(type: type , userId: userId);
    result.fold(
      (failure) => _setError(failure.message),
      (postsList) {
        _posts = postsList;
        _setLoading(false);
      },
    );
  }

  // 2. إنشاء منشور جديد
  Future<void> createNewPost({required PostEntity post , File? imageFile}  ) async {
    _setLoading(true);
    final result = await createPostUseCase.call(post: post , imageFile: imageFile);
    result.fold(
      (failure) => _setError(failure.message),
      (_) {
        final newpostModel = PostModel.fromEntity(post);
        _posts.insert(0, newpostModel); // إضافته في بداية القائمة محلياً لسرعة الاستجابة
        _setLoading(false);
      },
    );
  }

  

  // 4. حذف منشور
  Future<void> deleteExistingPost(String postId) async {
    final backupPosts = List<PostEntity>.from(_posts);
    _posts.removeWhere((p) => p.id == postId);
    notifyListeners();

    final result = await deletePostUseCase.call(postId: postId);

    result.fold(
      (failure) {
        // في حال فشل الحذف بالسيرفر، نعيد المنشور للقائمة
        _posts = backupPosts;
        _setError(failure.message);
      },
      (_) {
        _failureMessage = null;
        // تم الحذف بنجاح من السيرفر والـ Storage
      },
    );
    // _setLoading(true);
    // final result = await deletePostUseCase.call(postId: postId);
    // result.fold(
    //   (failure) => _setError(failure.message),
    //   (_) {
    //     _posts.removeWhere((post) => post.id == postId);
    //     _setLoading(false);
    //   },
    // );
  }

  // دالة مساعدة لتحديث حالة التحميل
  void _setLoading(bool value) {
    _isLoading = value;
    _failureMessage = null;
    notifyListeners();
  }

  // دالة مساعدة لتحديث حالة الخطأ
  void _setError(String message) {
    _failureMessage = message;
    _isLoading = false;
    notifyListeners();
  }

  // String _mapFailureToMessage(Failure failure) {
  //   // يمكنك تخصيص الرسائل حسب نوع الخطأ (Server, Cache, Network)
  //   return failure.message ?? "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً";
  // }
}