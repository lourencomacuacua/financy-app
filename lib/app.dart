import 'package:finaceiro/common/constantns/routes.dart';
import 'package:finaceiro/feactures/home/home_page.dart';
import 'package:finaceiro/feactures/home/home_page_view.dart';
import 'package:finaceiro/feactures/onbording/onbording_page.dart';
import 'package:finaceiro/feactures/profile/profile_page.dart';
import 'package:finaceiro/feactures/sing_in/sing_in_page.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_page.dart';
import 'package:finaceiro/feactures/splash/splash_page.dart';
import 'package:finaceiro/feactures/stats/stats_page.dart';
import 'package:finaceiro/feactures/walltet/wallet_page.dart';
import 'package:finaceiro/themes/defaul_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      initialRoute: NamesRoute.splash,
      routes: {
        NamesRoute.initial: (context) => const OnbordingPage(),
        NamesRoute.splash: (context) => const SplashPage(),
        NamesRoute.signUp: (context) => const SingUpPage(),
        NamesRoute.signIn: (context) => const SingInPage(),
        NamesRoute.home: (context) => const HomePageView(),
        NamesRoute.stats: (context) => const StatsPage(),
        NamesRoute.wallet: (context) => const WalletPage(),
        NamesRoute.profile: (context) => const ProfilePage(),
      },
    );
  }
}
