import 'package:bader_app_project/core/config/theme/theme_data/theme_controller.dart';
import 'package:bader_app_project/core/network/network_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkInfo networkInfo = NetworkInfo();

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    // AppSizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Switch')),
      body: Column(
        children: [
          Center(
            child: SwitchListTile(
              title: const Text('Dark Mode'),
              value: isDark,
              onChanged: ThemeController.toggleTheme,
            ),
          ),
          TextField(),
          Row(children: [
            Expanded( flex:1,
           child:
            ElevatedButton(onPressed: null, child: Text("data")),),
            //SizedBox(width: 5,),
           // Expanded(flex: 1,child: ElevatedButton(onPressed: (){}, child: Text("data"))),
          
          ],),
          ElevatedButton(
            //onPressed:null ,
            onPressed: () async {
       
              // 3. التحقق من بقاء المستخدم في الصفحة قبل إظهار الـ SnackBa
              final result =await networkInfo.isConnected;
              if ( result) {
                // حالة وجود إنترنت
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم الاتصال بالإنترنت بنجاح!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                // حالة عدم وجود إنترنت (أو فشل الـ DNS Lookup)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'لا يوجد وصول للإنترنت، يرجى التحقق من الشبكة',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("فحص جودة الاتصال"),
          ),

          Text("data")
        ],
      ),
    );
  }
}
   