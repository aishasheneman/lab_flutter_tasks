import 'package:bader_app_project/core/utils/widget/image_widget.dart';
import 'package:bader_app_project/core/utils/widget/logo_widget.dart';
import 'package:bader_app_project/core/utils/widget/secondary_elevatedbutton.dart';
import 'package:bader_app_project/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                postImage: "assets/images/bader_logo.png",
                height: 300,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: SecondaryElevatedbutton(

                  action: () async{
                    try{
                        final supa=Supabase.instance.client.auth;
    await supa.signInWithPassword(email: "wwwtrt11@gmail.com", password: '123456');
    print("success");
                    }catch(e){
                      print("error:$e");
                    }
                    if (context.mounted){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );}
                  },
                  text: 'التسجيل بإستخدام قوقل',
                  icon: FaIcon(FontAwesomeIcons.google),
                ),
              ),
              SizedBox(height: 10.h),
              SecondaryElevatedbutton(
                action: () {},
                text: 'التسجيل بإستخدام فيسبوك',
                icon: FaIcon(FontAwesomeIcons.facebook),
              ),
            ],
          ),
        ),
        LogoWidget(),
        SizedBox(height: 10.h),
      ],
    ));
  }
}
