import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/presentation/state_management/post_proveder.dart';

void showAddReportDialog(BuildContext context) {
  final TextEditingController contentController = TextEditingController();
  final provider = context.read<PostProvider>();
  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  showDialog(
    context: context,
    builder: (context) {
      // نستخدم StatefulBuilder لتحديث حالة الصورة داخل الـ Dialog
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(" عنوان التقرير"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: contentController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: "اكتب محتوى التقرير أو المنشور...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // عرض الصورة المختارة إذا وجدت
                  if (selectedImage != null)
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(selectedImage!, height: 150, width: double.infinity, fit: BoxFit.cover),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () => setState(() {
                                selectedImage = null;
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  
                  // زر اختيار الصورة
                  TextButton.icon(
                    onPressed: () async {
                      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          selectedImage = File(image.path);
                           
                        });
                      }
                    },
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text("إرفاق صورة (سيتحول لتقرير)"),
                  ),
                ],
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
                    final newPost = PostEntity(
                      title: "تقرير جديد" ,
                      content: contentController.text,
                      type: 'report', // تم التغيير ديناميكياً
                      Publisher: Supabase.instance.client.auth.currentUser!.id,
                      // ملاحظة: ستحتاج لإرسال الصورة للبروفايدر لرفعها لسوبابيس
                    );

                    provider.createNewPost(
                      post: newPost, 
                      imageFile: selectedImage, // تأكد من دعم دالتك لهذا البارامتر
                    );

                    Navigator.pop(context);
                  }
                },
                child: const Text("نشر"),
              ),
            ],
          );
        },
      );
    },
  );
}