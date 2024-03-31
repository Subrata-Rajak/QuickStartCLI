import 'core/common/widgets/basics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/common/blocs/theme_bloc.dart';
import 'core/routes/routes.dart';
import 'injection_container.dart';
import 'src/themes/dark.dart';
import 'src/themes/light.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initDep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with CommonWidgets {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeStates>(
        builder: (context, state) {
          if (state is ThemeInitialState) {
            context.read<ThemeBloc>().add(LoadInitialTheme());
          } else if (state is UpdatedThemeState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'FlutterTemplate',
              theme: appLightTheme,
              darkTheme: appDarkTheme,
              routerConfig: AppRoutes.instance.router,
              themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            );
          }
          return emptyContainer();
        },
      ),
    );
  }
}
