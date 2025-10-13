import 'package:flutter/cupertino.dart';
import 'package:shoes/screens/side_menu.dart';

import '../../screens/auth_wrapper.dart';
import '../../screens/cart_products.dart';
import '../../screens/details_product.dart';
import '../../screens/forget_password_page.dart';
import '../../screens/home_page.dart';
import '../../screens/on_borading.dart';
import '../../screens/profile_page.dart';
import '../../screens/sign_in_page.dart';
import '../../screens/sign_up_page.dart';

class RouteMangement{
 static Map<String,WidgetBuilder> route={

    RouteName.onBoarding:(context)=>OnBoardingScreen(),
    RouteName.detailsProduct:(context)=>DetailsProduct(),
    RouteName.cartProducts:(context)=>CartProducts(),
   RouteName.homePage:(context)=>HomePage(),
   RouteName.signIn:(context)=>SignInPage(),
   RouteName.signUp:(context)=>SignUpPage(),
   RouteName.forgetPassword:(context)=>ForgetPasswordPage(),
   RouteName.profilePage:(context)=>ProfilePage(),
   RouteName.checkIfSignInOrHomePage:(context)=>AuthWrapper(),
   RouteName.sideMenu:(context)=>SideMenu(),

 };



}
class RouteName{
  static String onBoarding="OnBoarding";
  static String homePage="homePage";
  static String detailsProduct="DetailsProduct";
  static String cartProducts="CartProducts";
  static String signIn="signInPage";
  static String signUp="signUpPage";
  static String forgetPassword="forgetPasswordPage";
  static String profilePage="ProfilePage";
  static String checkIfSignInOrHomePage="AuthWrapper";
  static String sideMenu ="SideMenuPage";

}