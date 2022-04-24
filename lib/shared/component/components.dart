

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tranning_api_dio/modules/webview_screen/webview_screen.dart';

Widget defualtBusiness(article,context)=>InkWell(
  onTap: (){
    navigatorTo(context, WebviewScreen(url: article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(12.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),

            image: DecorationImage(

              image: NetworkImage("${article["urlToImage"]}"),

              fit: BoxFit.cover,

            ),



          ),

        ),

        SizedBox(

          width: 15,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article["title"]}',

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),

                Text('${article["publishedAt"]}',

                  style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 15,

                    color: Colors.grey,

                  ),

                ),



              ],

            ),

          ),

        ),

      ],

    ),

  ),
);


Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String labelText,
  required var validate,
  var onTap,
  var onChange,
  var suffixIcon,
  var preIcon,


}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.deepOrange
        ),
        suffixIcon: suffixIcon,
        prefixIcon: preIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.deepOrange,width: 1)
        ),
        focusColor: Colors.deepOrange,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.deepOrange ),
            borderRadius: BorderRadius.circular(25)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.deepOrange ),
            borderRadius: BorderRadius.circular(25)

        ),


      ),
    );



void navigatorTo(context,widget)=>Navigator.push(
  context,
    MaterialPageRoute(
        builder: (context)=>widget
    )
);