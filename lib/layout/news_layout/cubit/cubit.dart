import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';
import 'package:tranning_api_dio/modules/business/business_screen.dart';
import 'package:tranning_api_dio/modules/science/science_screen.dart';
import 'package:tranning_api_dio/modules/sitting/sitting_screen.dart';
import 'package:tranning_api_dio/modules/sport/sport_screen.dart';
import 'package:tranning_api_dio/modules/technology/technology_screen.dart';
import 'package:tranning_api_dio/shared/network/local/cache_helper.dart';
import 'package:tranning_api_dio/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.engineering), label: 'technology'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screensLayout = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    TechnologyScreen(),
    // SettingScreen(),
  ];
  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) getBusiness(contry:countryLanguage );
    if (index == 1) getScience(contry:countryLanguage);
    if (index == 2) getSports(contry:countryLanguage);
    if (index == 3) getTechnology(contry:countryLanguage);

    emit(NewsBottomNavState());
  }

  List<dynamic> technology=[];
  void getTechnology({ String? contry}) {
    technology=[];

    emit(NewsGetTechnologyLoadingState());
    if (technology.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': '$contry',
        'category': 'technology',
        'apiKey': '1e7da229b2b84dc1985723386dcf855a'
      }).then((value) {
        technology = value.data['articles'];
        print(technology[0]['title']);
        emit(NewsGetTechnologySuccessState());
      }).catchError((error) {
        print("${error.toString()}");
        emit(NewsGetTechnologyErrorState(error.toString()));
      });
    } else {
      emit(NewsGetTechnologySuccessState());
    }
  }


  List<dynamic> business = [];



  void getBusiness({ String? contry}) {
    business=[];

    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': '$contry',
        'category': 'business',
        'apiKey': '1e7da229b2b84dc1985723386dcf855a'
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print("${error.toString()}");
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports({ String? contry}) {
    sports=[];
    emit(NewsGetSportLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': '$contry',
        'category': 'sports',
        'apiKey': '1e7da229b2b84dc1985723386dcf855a'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print("${error.toString()}");
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience({ String? contry}) {
    science=[];
    emit(NewsGetSciencesLoadingState());

    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': '$contry',
        'category': 'science',
        'apiKey': '1e7da229b2b84dc1985723386dcf855a'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetSciencesSuccessState());
      }).catchError((error) {
        print("${error.toString()}");
        emit(NewsGetSciencesErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSciencesSuccessState());
    }
  }

  /// /// here i use shared preferences for directional
  bool directionIsLTR = true;

  void changeDirection({bool? directionIsLTRShared}) {
    if (directionIsLTRShared != null) {
      directionIsLTR = directionIsLTRShared;
      emit(NewsAppChangeDirectionState());
    } else {
      directionIsLTR = !directionIsLTR;
      CacheHelper.putBoolDirection(key: 'directionIsLTR', value: directionIsLTR)
          .then((value) {
        emit(NewsAppChangeDirectionState());
      });
    }
  }

  Widget changeIconDirections = Icon(
    Icons.format_textdirection_l_to_r_outlined,
  );

  void changeIconDirection() {
    directionIsLTR
        ? changeIconDirections =Icon(
            Icons.format_textdirection_l_to_r_outlined,

          )
        : changeIconDirections =Icon(
            Icons.format_textdirection_r_to_l_outlined,

          );

    emit(NewsAppChangeIconDirectionState());
  }

  /// here i use shared preferences for mode dark
  bool isDark = true;

  void changeAppMode({bool? isDarkShared}) {
    if (isDarkShared != null) {
      isDark = isDarkShared;
      emit(NewsAppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppChangeModeState());
      });
    }
  }

  ///   change MODE
  Widget iconModeIsDark = Icon(Icons.brightness_4_outlined);

  void changeIconMode() {
    isDark
        ? iconModeIsDark = Icon(
            Icons.brightness_5,
            color: colorIcon,
          )
        : iconModeIsDark = Icon(
            Icons.brightness_4_outlined,
            color: colorIcon,
          );

    emit(NewsAppChangeIconModeState());
  }

  /// CHANGE ICON COLOR
  Color colorIcon = Colors.white;

  void changeColorIcon() {
    isDark ? colorIcon = Colors.black : colorIcon = Colors.white;
    emit(NewsAppChangeColorIconState());
  }
  bool colorIconIsChanged=true;


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];

    if (search.length == 0) {
      DioHelper.getData(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '1e7da229b2b84dc1985723386dcf855a'
      }).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print("${error.toString()}");
        emit(NewsGetSearchErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

/// FOR DropDownButton
  String countryLanguage ='us';
 List <String>  dropDownButtonValues=[
   'us','ae','ru','fr'
 ];
 void changeLanguageOfSrearch({required String language}){
   if(language!=null){
     countryLanguage=language;
     getBusiness(contry: countryLanguage);
     getScience(contry: countryLanguage);
     getSports(contry: countryLanguage);
     changeHeadLine(countryName:countryLanguage );
     getTechnology(contry:countryLanguage);
     emit(NewsAppChangeLanguageOfSearch());
   }else{
     countryLanguage=language;
     CacheHelper.putLanguage(key: 'countryLanguage', value: countryLanguage).then((value) {
       getBusiness(contry: countryLanguage);
       getScience(contry: countryLanguage);
       getSports(contry: countryLanguage);
       changeHeadLine(countryName:countryLanguage );
       getTechnology(contry:countryLanguage);
       emit(NewsAppChangeLanguageOfSearch());
     });
   }
 }

 String textAppBar='News';
 List<String> textAppBarTitle=[
   'News',
   'الأخبار','НОВОСТИ','Les Nouvelles'
 ];

 String changeModeText='Change Mode';
  List<String> changeModeTextTitle=[
    'Change Mode',
    'تغيير النمط','изменить режим','Changer de mode'
  ];

  String changeDirectionText='Change Direction';
  List <String> changeDirectionTitle=[
    'Change Direction','تغيير الاتجاه','Изменить направление','Changer de direction'
  ];
  String changeCountryText='Change Country';

  List <String> changeCountryTitle=[
    'Change Country','تغيير اللغة','Сменить страну','Changer de pays'
  ];

  void changeHeadLine({required String countryName}){
    if(countryName=='us'){
      textAppBar= textAppBarTitle[0];
      changeModeText=changeModeTextTitle[0];
      changeDirectionText=changeDirectionTitle[0];
      changeCountryText=changeCountryTitle[0];
      emit(NewsAppChangeLanguageOfTitles());
    }else if(countryName=='ae'){
      textAppBar= textAppBarTitle[1];
      changeModeText=changeModeTextTitle[1];
      changeDirectionText=changeDirectionTitle[1];
      changeCountryText=changeCountryTitle[1];
      emit(NewsAppChangeLanguageOfTitles());
    }else if(countryName=='ru'){
      textAppBar= textAppBarTitle[2];
      changeModeText=changeModeTextTitle[2];
      changeDirectionText=changeDirectionTitle[2];
      changeCountryText=changeCountryTitle[2];
      emit(NewsAppChangeLanguageOfTitles());
    }else {
      textAppBar= textAppBarTitle[3];
      changeModeText=changeModeTextTitle[3];
      changeDirectionText=changeDirectionTitle[3];
      changeCountryText=changeCountryTitle[3];
      emit(NewsAppChangeLanguageOfTitles());
    }

  }

}
