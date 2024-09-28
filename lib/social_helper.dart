import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'core/theming/switch_mode.dart';

class SocialHelper extends StatefulWidget {
  SocialHelper({super.key, required this.appRouter});
  AppRouter appRouter;

  @override
  State<SocialHelper> createState() => _SocialHelperState();
}

class _SocialHelperState extends State<SocialHelper> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeClass.darkTheme,
        // locale: value.language,
        // localizationsDelegates: const [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  }
}
