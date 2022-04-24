import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/cubit.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';
import 'package:tranning_api_dio/modules/search_screen/search_screen.dart';
import 'package:tranning_api_dio/modules/sitting/sitting_screen.dart';
import 'package:tranning_api_dio/shared/component/components.dart';



class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){
        print(state);
      },
      builder:  (context,state){
        NewsCubit cubits = NewsCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: Text(cubits.textAppBar),
            ),
            actions: [
              IconButton(onPressed: (){
                navigatorTo(context, SearchScreen());

              }, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    navigatorTo(context,SettingScreen());
                  },
                  icon: Icon(Icons.settings)
              ),


            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubits.currentIndex,
            onTap: (index){
              cubits.changeBottomNavBar(index);
            },
            items: cubits.bottomNavItems,
          ),
          body: cubits.screensLayout[cubits.currentIndex],
        );
      },
    );
  }
}
