import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/cubit.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';
import 'package:tranning_api_dio/shared/component/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state)=>{},
      builder: (context,state){
        var list= NewsCubit.get(context ).science;
        return  list.length!=0?
        ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>defualtBusiness(list[index],context), separatorBuilder:(context,index)=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.deepOrange,
          ),
        ), itemCount: list.length)

            :Center(child: CircularProgressIndicator(
          color: Colors.deepOrange,
        )) ;
      },
    );
  }
}
