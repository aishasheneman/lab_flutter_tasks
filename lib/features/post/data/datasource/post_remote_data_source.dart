import 'dart:io';
import 'package:bader_app_project/features/post/data/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostRemoteDataSource {
   final supabase = Supabase.instance.client;

  PostRemoteDataSource();
 
 //رفع الصورة
  Future<String> uploadImageToStorage(File file) async {
    //final extension = file.path.split('.').last; // امتداد ديناميكي
    final fileName = "${DateTime.now().millisecondsSinceEpoch}.png";
    final path = 'posts/$fileName';
    
    await supabase.storage.from("posts img").upload(path, file);
      //  fileOptions: FileOptions(contentType: 'image/$extension'));
    
    return supabase.storage.from("posts img").getPublicUrl(path);
  }

// حذف الصورة
  Future<void> deleteImageFromStorage(String imageUrl) async {
    final uri = Uri.parse(imageUrl);
    final path = uri.pathSegments.sublist(uri.pathSegments.indexOf('post_images') + 1).join('/');
    await supabase.storage.from('post_images').remove([path]);
  }

// إضافة البيانات
   Future<void> createPost(PostModel post) async {
    await supabase.from('posts').insert(post.toJson());
   }

// قراءة البيانات
   Future<List<PostModel>> readPosts({String? type, String? userId}) async {
    var query = supabase.from('posts').select('''
          *,
          profiles:publisher_id ( full_name, role )
        ''');
        if (type != null) query = query.eq('type' , type);
        if (userId != null) query = query.eq('publisher_id' , userId);
        final result = await query.order('created_at', ascending: false);
    return (result as List).map((json) => PostModel.fromJson(json)).toList();
  }

// حذف البيانات
   Future<void> deletePost(String id) async {
    await supabase.from('posts').delete().eq('id', id);
}


// جلب البيانات الحديثة
Future<List<PostModel>> fetchRecentPosts() async {
  // حساب تاريخ ما قبل 7 أيام من الآن
  final sevenDaysAgo = DateTime.now().subtract(Duration(days: 7)).toIso8601String();

  var query = supabase.from('posts').select('''
        *,
        profiles:publisher_id ( full_name )
      ''');

  // إضافة فلتر التاريخ: أكبر من أو يساوي تاريخ قبل 7 أيام
  final response = await query
      .gte('created_at', sevenDaysAgo) 
      .order('created_at', ascending: false);

  final List data = response as List;
  return data.map((post) => PostModel.fromJson(post)).toList();
}

}