import 'package:flutter/material.dart';

class DataStateHandler extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final bool isEmpty;
  final VoidCallback onRetry;
  final Widget child;

  const DataStateHandler({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.isEmpty,
    required this.onRetry,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // 1. حالة التحميل
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. حالة الخطأ
    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text("إعادة المحاولة"),
            )
          ],
        ),
      );
    }

    // 3. حالة القائمة الفارغة
    if (isEmpty) {
      return const Center(child: Text("لا توجد بيانات حالياً"));
    }

    // 4. حالة النجاح (عرض البيانات الفعلية)
    return child;
  }
}