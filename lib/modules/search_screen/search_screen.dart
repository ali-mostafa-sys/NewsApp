import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/cubit.dart';
import 'package:tranning_api_dio/layout/news_layout/cubit/states.dart';
import 'package:tranning_api_dio/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultTextForm(
                validate: (value) {
                  if (value.isEmpty) {
                    return "search must not be empty";
                  }
                  return null;
                },
                onChange: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                controller: controllers,
                labelText: 'search',
                textInputType: TextInputType.text,
              ),
            ),
            Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        defualtBusiness(list[index], context),
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 5),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.deepOrange,
                          ),
                        ),
                    itemCount: list.length)),
          ]),
        );
      },
    );
  }
}

/// Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: defaultTextForm(
//               validate: (String value) {
//                 if(value.isEmpty){
//                   return "search must not be empty";
//                 }
//                 return null;
//               },
//               onChange: (value){
//
//               },
//               controller: controllers,
//               labelText: 'search',
//               textInputType: TextInputType.text,
//             ),
//           ),
//         ],
//       ),
//     );
