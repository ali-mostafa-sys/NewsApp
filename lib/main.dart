import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';
import 'package:tranning_api_dio/shared/bloc_observer.dart';
import 'package:tranning_api_dio/shared/network/local/cache_helper.dart';
import 'package:tranning_api_dio/shared/network/remote/dio_helper.dart';

import 'layout/news_layout/cubit/cubit.dart';
import 'layout/news_layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.grtBool(key: 'isDark');
  bool? directionIsLTR = CacheHelper.grtBoolDirection(key: 'directionIsLTR');
  String? language=CacheHelper.grtLanguage(key: 'countryLanguage');

  runApp(MyApp(
    isDark: true,
    directionIsLTR: true,
    language: 'us',
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final bool directionIsLTR;
  final String language;

  MyApp({required this.isDark, required this.directionIsLTR,
  required this.language
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..changeAppMode(isDarkShared: isDark)
            ..changeDirection(directionIsLTRShared: directionIsLTR)..changeColorIcon(),
        ),
        BlocProvider(
            create: (BuildContext context) => NewsCubit()
              ..getBusiness(contry: NewsCubit.get(context).countryLanguage)
              ..getScience(contry: NewsCubit.get(context).countryLanguage)
              ..getSports(contry: NewsCubit.get(context).countryLanguage)
              ..changeLanguageOfSrearch(
                  language: NewsCubit.get(context).countryLanguage))
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

                scaffoldBackgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.grey[100],
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.deepOrange[100],
                  elevation: 25,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ))),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                
                iconTheme: IconThemeData(
                    color: Colors.white
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.deepOrange[100],
                  elevation: 25,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ))),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
                textDirection: NewsCubit.get(context).directionIsLTR
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: NewsLayout()),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
