import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/cubit.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubits = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            
            body: Drawer(

              child: Container(
                color: NewsCubit.get(context).isDark
                    ? HexColor('333739')
                    : Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            cubits.changeModeText,
                            style: TextStyle(
                              fontSize: 20,
                              color: cubits.isDark?Colors.white:Colors.black

                            ),
                          )),
                          IconButton(
                              onPressed: () {
                                NewsCubit.get(context).changeAppMode();
                                NewsCubit.get(context).changeIconMode();
                                NewsCubit.get(context).changeColorIcon();
                              },
                              icon: cubits.iconModeIsDark)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                cubits.changeDirectionText,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: cubits.isDark?Colors.white:Colors.black

                                ),
                              )),
                          IconButton(
                              onPressed: () {
                                NewsCubit.get(context).changeDirection();
                                NewsCubit.get(context).changeIconDirection();

                              },
                              icon: cubits.changeIconDirections)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                cubits.changeCountryText,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: cubits.isDark?Colors.white:Colors.black

                                ),
                              )),




              DropdownButton(
                value: NewsCubit.get(context).countryLanguage,
                icon:  Icon(Icons.arrow_downward, color: cubits.isDark?Colors.white:Colors.black,),
                elevation: 16,

                style:  TextStyle(color:Colors.black),
                underline: Container(
                  height: 0,
                ),
                onChanged: ( String? newValue) {
                  //newValue=cubits.countryLanguage;
                  cubits.changeLanguageOfSrearch(language: newValue!);


                }, items: NewsCubit.get(context).dropDownButtonValues
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              ),
                   ] ),
          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
