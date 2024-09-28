import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_helper_app/social_helper.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    SocialHelper(
      appRouter: AppRouter(),
    ),
  );
}
