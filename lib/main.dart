import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/resources/core/config/theme/cubit_theme.dart';
import 'package:shoes/resources/core/config/theme/theme_data/theme_data_dark.dart';
import 'package:shoes/resources/core/config/theme/theme_data/theme_data_light.dart';
import 'package:shoes/resources/core/route_management.dart';

import 'cubit/cubit_brands_homePage.dart';
import 'cubit/cubit_cart_products.dart';
import 'cubit/cubit_isSeeAllProduct.dart';
import 'cubit/cubit_prodect.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(
    MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (context)=>ProductsCubit()..getProduct(),
          ),
          BlocProvider(
            create: (context)=>CubitCartProduct(),
          ),
          BlocProvider(
            create: (context)=>BrandsCubit(),
          ),
          BlocProvider(
            create: (context)=>SeeAllProduct(),
          ),
          BlocProvider(
            create: (context)=>ThemeCubit(),
          ),
        ],
        child: MyApp(seenOnboarding:seenOnboarding ,)),

  );
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;


  MyApp({super.key,required this.seenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeMode >(
  builder: (context, state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: state ,
      initialRoute:seenOnboarding?RouteName.checkIfSignInOrHomePage:RouteName.onBoarding ,
      routes:RouteMangement.route ,


    );
  },
);
  }
}

