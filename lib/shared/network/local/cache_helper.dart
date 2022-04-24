
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
   static late SharedPreferences shared;
   static init()async{
     shared=await SharedPreferences.getInstance();
   }

 // GET AND PUT FOR MODE IS DARK OR NOT
  static Future<bool> putBool({
  required String key,
     required bool value,
})async
   {
    return await shared.setBool(key, value);

}

   static bool? grtBool({
     required String key,

   })
   {
     return shared.getBool(key);

   }

   //  GET AND PUT FOR DIRECTION IS LTR OR RTL

   static Future<bool> putBoolDirection({
     required String key,
     required bool value,
   })async
   {
     return await shared.setBool(key, value);

   }

   static bool? grtBoolDirection({
     required String key,

   })
   {
     return shared.getBool(key);

   }

   /// GET AND PUT FOR LANGUAGE OF SEARCH
   static Future<bool> putLanguage({
     required String key,
     required String value,
   })async
   {
     return await shared.setString(key, value);

   }

   static String? grtLanguage({
     required String key,

   })
   {
     return shared.getString(key);

   }
}