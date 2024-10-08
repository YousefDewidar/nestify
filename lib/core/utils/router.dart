import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/auth/presentation/view/forget_pass_view.dart';
import 'package:nestify/features/auth/presentation/view/get_owner_info_view.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';
import 'package:nestify/features/auth/presentation/view/signup_view.dart';
import 'package:nestify/features/auth/presentation/view/user_or_owner_view.dart';
import 'package:nestify/features/auth/presentation/view/verification_view.dart';
import 'package:nestify/features/auth/presentation/view/verified_view.dart';
import 'package:nestify/features/discover/presentation/view/discover_view.dart';
import 'package:nestify/features/owner%20main/presentation/views/add_property_view.dart';
import 'package:nestify/features/home/presentation/views/contact_owner_view.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_view_body.dart';
import 'package:nestify/features/favourite/presentation/view/fav_view.dart';
import 'package:nestify/features/home/presentation/views/home_view.dart';
import 'package:nestify/features/messages/presentation/view/messanger_view.dart';
import 'package:nestify/features/main/presentation/views/main_view.dart';
import 'package:nestify/features/splash/presentation/view/landing_view.dart';
import 'package:nestify/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.splashViewRoute:
      return CupertinoPageRoute(builder: (_) => const SplashView());

    case AddRouter.landingListViewRoute:
      return CupertinoPageRoute(builder: (_) => const LandingView());

    case AddRouter.userOrOwnerView:
      return CupertinoPageRoute(builder: (_) => const UserOrOwnerView());

    case AddRouter.getOwnerInfoView:
      {
        return CupertinoPageRoute(builder: (_) => const GetAboutOwnerView());
      }
    case AddRouter.signupViewRoute:
      {
        return CupertinoPageRoute(builder: (_) => const SignupView());
      }
    case AddRouter.addPropertyView:
      return CupertinoPageRoute(builder: (_) => const AddPropertyView());

    case AddRouter.verificationRoute:
      return CupertinoPageRoute(builder: (_) => const VerificationView());

    case AddRouter.verifiedRoute:
      return CupertinoPageRoute(builder: (_) => const VerifiedView());

    case AddRouter.mainView:
      return CupertinoPageRoute(
          builder: (context) => const MainView());

    case AddRouter.homeView:
      return CupertinoPageRoute(builder: (context) => const HomeView());

    case AddRouter.messageView:
      return CupertinoPageRoute(builder: (_) => const MessangerView());

    case AddRouter.discView:
      return CupertinoPageRoute(builder: (_) => const DiscoverView());

    case AddRouter.favView:
      return CupertinoPageRoute(builder: (_) => const FavView());

    case AddRouter.loginViewRoute:
      return CupertinoPageRoute(builder: (_) => const LoginView());

    case AddRouter.chatView:
      {
        return CupertinoPageRoute(builder: (context) => const ChatViewBody());
      }
    case AddRouter.forgetPassViewRoute:
      return CupertinoPageRoute(builder: (_) => const ForgetPassView());
    case AddRouter.contactOwner:
      return CupertinoPageRoute(builder: (_) => const ContactOwnerView());

    default:
      return CupertinoPageRoute(builder: (_) => const SplashView());
  }
}
