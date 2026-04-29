import 'package:bader_app_project/core/utils/widget/data_state_handler.dart';
import 'package:bader_app_project/core/utils/widget/tabpar_widget.dart';
import 'package:bader_app_project/features/post/presentation/widgets/post_widget.dart';
import 'package:bader_app_project/features/post/presentation/state_management/post_proveder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, this.invisibil = false});
  final bool invisibil;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final id = Supabase.instance.client.auth.currentUser?.id;
@override
  void initState() {
    super.initState();
    // جلب البيانات عند تشغيل الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["الكل", "المنشورات", "التقارير"];
    return Scaffold(
        body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          return DataStateHandler(
            isLoading: provider.isLoading,
            errorMessage: provider.failureMessage,
            isEmpty: provider.posts.isEmpty,
            onRetry: () => provider.getAllPosts(),
            child: RefreshIndicator(
              onRefresh: () => provider.getAllPosts(),
              child: Column(   
      children: [
        if (!widget.invisibil) ...[
          SizedBox(height: 5.h),
          TabparWidget(tabs: tabs ,
          onChanged: (index) {
                      // تحديد النوع بناءً على التبويب المختار
                      String? selectedType;
                      if (index == 1) selectedType = "post"; // تأكد من مطابقة الاسم في قاعدة البيانات
                      if (index == 2) selectedType = "report";

                      // استدعاء دالة الجلب مع الفلترة
                      provider.getAllPosts(type: selectedType);
                    },),
          SizedBox(height: 5.h),
        ],
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.posts.length,
            itemBuilder: (context, index) {
              final item = provider.posts[index];

              return PostWidget(item: item);
            },
          ),
        ),
      ],
    )
    ),
          );
        },
      ),);
  }
}
