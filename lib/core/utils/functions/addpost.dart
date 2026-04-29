import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/presentation/state_management/post_proveder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

 void showAddPostDialog(BuildContext context) {
  final TextEditingController contentController = TextEditingController();
  final provider = context.read<PostProvider>();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("إضافة منشور جديد"),
      content: TextField(
        controller: contentController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: "اكتب محتوى المنشور هنا...",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          onPressed: () {
            if (contentController.text.trim().isNotEmpty) {
              // إنشاء كائن المنشور الجديد
              final newPost = PostEntity(
                title: "منشور جديد",
                content: contentController.text,
                type: "post", // يمكنك تغييره حسب الحاجة
                Publisher: Supabase.instance.client.auth.currentUser!.id,
                
              );

              // استدعاء دالة الإضافة في البروفايدر
              provider.createNewPost(post: newPost);
              
              Navigator.pop(context); // إغلاق النافذة
            }
          },
          child: const Text("نشر"),
        ),
      ],
    ),
  );
}