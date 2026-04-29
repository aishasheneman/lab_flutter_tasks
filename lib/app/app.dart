import 'package:bader_app_project/core/config/theme/theme_data/theme_controller.dart';
import 'package:bader_app_project/core/config/theme/theme_data/theme_data_dark.dart';
import 'package:bader_app_project/core/config/theme/theme_data/theme_data_light.dart';
import 'package:bader_app_project/core/network/network_info.dart';
import 'package:bader_app_project/features/post/data/datasource/post_local_data_source.dart';
import 'package:bader_app_project/features/post/data/datasource/post_remote_data_source.dart';
import 'package:bader_app_project/features/post/data/repostories/post_repository_iml.dart';
import 'package:bader_app_project/features/post/domain/usecase/createpost_usecase.dart';
import 'package:bader_app_project/features/post/domain/usecase/deletepost_usecase.dart';
import 'package:bader_app_project/features/post/domain/usecase/readposts_usecase.dart';
import 'package:bader_app_project/features/post/presentation/state_management/post_proveder.dart';
import 'package:bader_app_project/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BaderApp extends StatelessWidget {
   BaderApp({super.key});
  final remoteDataSource = PostRemoteDataSource();
    final repository = PostRepositoryImple(
      remoteDataSource: PostRemoteDataSource(),
      networkInfo: NetworkInfo(), // تأكد من وجود هذا الكلاس لديك
      localDataSource: PostLocalDataSource(),
    );


  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (_, mode, __) {
            return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(
            readPostsUseCase: ReadPostsUseCase(repository: repository),
            createPostUseCase: CreatePostUseCase(repository),
            deletePostUseCase: DeletePostUseCase(repository),
          ),
        ),
      ],
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getLightTheme(),
              darkTheme: getDarkTheme(),
              themeMode: mode,

              builder: (context, child) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: child ?? const SizedBox(),
                );
              },

              home: SplashScreen(),

              // routes: {
              //   "createaccountforteam": (context) => TeamRegisterScreen(),
              //   "createaccountforvol": (context) => RegisterScreen(),
              //   "createtask": (context) => AddTaskScreen(),
              //   "detialstask": (context) => TaskDetailScreen(),
              //   "givepoint": (context) => TeamProfileWithPointsGrant(),
              //   "googleform": (context) => CreateSurveyPage(),
              //   "homepage": (context) => VolunteerPostsScreen(),
              //   "login": (context) => LoginScreen(),
              //   "nextcreatetesk": (context) => AddTaskAdvancedScreen(),
              //   "postofbose": (context) => AnnouncementsScreen(),
              //   "profile": (context) => TeamProfileScreen(),
              //   "sharemembers": (context) => InviteMemberScreen(),
              //   "showallteam": (context) => TeamsDirectoryScreen(),
              //   "showevent": (context) => EventsScreen(),
              //   "showtask": (context) => TasksByCategoryScreen(),
              //   "sidepage": (context) => TeamDrawer(),
              // },
            ));
          },
        );
      },
    );
  }
}
