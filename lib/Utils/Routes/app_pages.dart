import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:joanie_jasons_day/Auth_Module/Bindings/otp_binding.dart';
import 'package:joanie_jasons_day/Auth_Module/Bindings/prelogin_binding.dart';
import 'package:joanie_jasons_day/Auth_Module/Bindings/signup_binding.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/otp_controller.dart';
import 'package:joanie_jasons_day/Auth_Module/Screens/login.dart';
import 'package:joanie_jasons_day/Auth_Module/Screens/otp_verification.dart';
import 'package:joanie_jasons_day/Auth_Module/Screens/prelogin.dart';
import 'package:joanie_jasons_day/Auth_Module/Screens/signup.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Bindings/get_all_category_binding.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Bindings/get_all_favorite_binding.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Bindings/get_profile_binding.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Bindings/get_sub_category_binding.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/add_order_controller.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_category.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_favorite_controller.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_profile_controller.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Models/add_order_model.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/favorites_screen.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/home_screen.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/profile.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/shopping_cart_screen.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/widgets/bottom_nav_bar.dart';
import 'package:joanie_jasons_day/Checkout/screen/checkout_screen.dart';
import 'package:joanie_jasons_day/Checkout/screen/order_status_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Bindings/logout_binding.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Bindings/termscondition_privacypolicy_binding.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/add_card_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/logout_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/card_detail_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/contactus_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/privacy_policy_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/settings_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/terms_and_condition_screen.dart';
import 'package:joanie_jasons_day/Edit_Profile/Binding/edit_profile_binding.dart';
import 'package:joanie_jasons_day/Edit_Profile/screens/edit_profile.dart';
import 'package:joanie_jasons_day/Menu/Controllers/add_remove_fav_controller.dart';
import 'package:joanie_jasons_day/Menu/screens/coffee_screen.dart';
import 'package:joanie_jasons_day/Password/Bindings/change_older_password_binding.dart';
import 'package:joanie_jasons_day/Password/Bindings/forgot_password_binding.dart';
import 'package:joanie_jasons_day/Password/screens/change_older_password.dart';
import 'package:joanie_jasons_day/Password/screens/change_password.dart';
import 'package:joanie_jasons_day/Password/screens/forgot_password.dart';
import 'package:joanie_jasons_day/Past_Orders/screen/past_orders_screen.dart';
import 'package:joanie_jasons_day/Product_details/Controller/product_details_controller.dart';
import 'package:joanie_jasons_day/Product_details/screens/product_details_screen.dart';
import 'package:joanie_jasons_day/Selections/Binding/get_restaurant_binding.dart';
import 'package:joanie_jasons_day/Selections/screens/select_stores.dart';
import 'package:joanie_jasons_day/Success/screens/success_screen.dart';
import 'package:joanie_jasons_day/splash_screen/screens/splash_screen.dart';

import '../../Auth_Module/Bindings/login_binding.dart';
import '../../Password/Bindings/change_password_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN_ROUTE,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN_ROUTE,
      page: () => SignupScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN_ROUTE,
      page: () => SplashScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION_SCREEN_ROUTE,
      page: () => OtpVerification(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.PRE_LOGIN_SCREEN_ROUTE,
      page: () => PreLogin(),
      binding: PreLoginBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES_SCREEN_ROUTE,
      page: () => FavoritesScreen(),
      //binding: GetAllFavoriteBinding(),
      binding: BindingsBuilder(() {
        Get.lazyPut<GetAllFavoriteController>(() => GetAllFavoriteController());
        Get.lazyPut<AddOrRemoveFavoriteController>(() => AddOrRemoveFavoriteController());
      }),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN_ROUTE,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<GetAllCategoryController>(() => GetAllCategoryController());
      }),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN_ROUTE,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<GetProfileController>(() => GetProfileController());
      }),
    ),
    GetPage(
      name: _Paths.SHOPPING_CART_SCREEN_ROUTE,
      page: () => ShoppingCart(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddOrderController>(() => AddOrderController());
      }),
    ),
    GetPage(
      name: _Paths.CHECKOUT_SCREEN_ROUTE,
      page: () => CheckoutScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_STATUS_SCREEN_ROUTE,
      page: () => OrderStatusScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_DETAIL_SCREEN_ROUTE,
      page: () => CardDetailScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddCardController>(() => AddCardController());
      }),
    ),
    GetPage(
      name: _Paths.CONTACT_US_SCREEN_ROUTE,
      page: () => ContactUsScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY_SCREEN_ROUTE,
      page: () => PrivacyPolicyScreen(),
      binding: TermsConditionPrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_SCREEN_ROUTE,
      page: () => SettingsScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITIONS_SCREEN_ROUTE,
      page: () => TermsAndConditionScreen(),
      binding: TermsConditionPrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_SCREEN_ROUTE,
      page: () => EditProfile(),
      binding: EditProfileBinding(),
    ),
    // GetPage(
    //   name: _Paths.BREAKFAST_BRUNCH_SCREEN_ROUTE,
    //   page: () => BreakfastBrunchScreen(),
    //   binding: LoginBinding(),
    // ),
    GetPage(
      name: _Paths.COFFEE_SCREEN_ROUTE,
      page: () => CoffeeScreen(),
      // binding: GetSubCategoryBinding(),
    ),
    // GetPage(
    //   name: _Paths.DRINKS_SCREEN_ROUTE,
    //   page: () => DrinksScreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.LUNCH_DINNER_SCREEN_ROUTE,
    //   page: () => LunchDinnerScreen(),
    //   binding: LoginBinding(),
    // ),
    GetPage(
      name: _Paths.CHANGE_OLDER_PASSWORD_SCREEN_ROUTE,
      page: () => ChangeOlderPassword(),
      binding: ChangeOlderPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_SCREEN_ROUTE,
      page: () => ChangePassword(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SCREEN_ROUTE,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PAST_ORDERS_SCREEN_ROUTE,
      page: () => PastOrdersScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_SCREEN_ROUTE,
      page: () => ProductDetailsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
      }),
    ),
    GetPage(
      name: _Paths.SELECT_STORE_SCREEN_ROUTE,
      page: () => SelectStoreScreen(),
      binding: GetRestaurantBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_SCREEN_ROUTE,
      page: () => SuccessScreen(),
      //binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTON_NAVBAR_ROUTE,
      page: () => BottomNavBar(),
      // binding: LogoutBinding(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LogoutController>(() => LogoutController());
        Get.lazyPut<GetAllCategoryController>(() => GetAllCategoryController());
      }),
    ),
  ];
}
