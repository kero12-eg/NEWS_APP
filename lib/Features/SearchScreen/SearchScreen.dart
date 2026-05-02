import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Routing/App_Routes.dart';
import 'package:news_app/Features/SearchScreen/Widgets/CustomTextField.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
 TextEditingController controller = TextEditingController();

final GlobalKey<FormState> formkey = GlobalKey<FormState>();

@override
void initState() {
  super.initState();
  controller = TextEditingController();
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Customtextfield(controller: controller,validator: (value) {
               if(value!.isEmpty){return LocaleKeys.Valid.tr();}
               return null;
            },
            onpressed1: () {
              if (formkey.currentState!.validate()) {
                context.push(AppRoutes.searchresultsscreen,extra: controller.text);
              }
            },
            onpressed2: () {
              controller.clear();
            },
            
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pushReplacementNamed(AppRoutes.homescreen);
              },
              child: Text(
                LocaleKeys.cancel.tr(),
                style: TextStyle(color: Colors.black),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
