import 'package:flutter/material.dart';
import 'package:iti/screens/AllReviews.dart';
import 'package:iti/screens/orderConfirmed.dart';
import 'package:iti/screens/splashScreen.dart';

import 'constants/routes.dart';
import 'models/product.dart';
import 'screens/AppInfo.dart';
import 'screens/cartsPage.dart';
import 'screens/detailsPage.dart';
import 'screens/developerTeam.dart';
import 'screens/home.dart';
import 'screens/login_register/login.dart';
import 'screens/login_register/register.dart';
import 'screens/onBoarding/firstPage.dart';
import 'screens/productsPage.dart';
import 'screens/profilePage.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPageRoute:
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case appInfoPage:
        return MaterialPageRoute(builder: (_) => const AppInfo());
      case profilePageRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case developerTeamPageRoute:
        return MaterialPageRoute(builder: (_) => const developerTeam());
      case splashPageRoute:
        return MaterialPageRoute(builder: (_) => const splashScreen());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => const login());
      case registerPageRoute:
        return MaterialPageRoute(builder: (_) => const rigester());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => home());
      case cartsPageRoute:
        return MaterialPageRoute(builder: (_) => const cartsPage());
      case reviewsPageRoute:
        return MaterialPageRoute(builder: (_) => Reviews());
      case detailPageRoute:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => detailsPage(product: product),
        );
      case produPage:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductsPage(category: category),
        );
      case orderConfimedPageRoute:
        return MaterialPageRoute(builder: (_) => const orderConfirm());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
