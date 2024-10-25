import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/colors.dart';
import '../core/utils/app_injector.dart';
import '../core/utils/app_router.dart';
import '../features/home/data/repositories/characters_repo_impl.dart';
import '../features/home/presentation/cubit/characters_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(getIt.get<CharactersRepoImpl>())..getAllCharacters(),
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MyColors.kPrimaryColor,
          ),
          routerConfig: AppRouter().routes,
        ),
      ),
    );
  }
}
