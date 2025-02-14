import 'dart:developer';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/widget/custom_bottom_app_bar_item.dart';
import 'package:finaceiro/feactures/home/home_page.dart';
import 'package:finaceiro/feactures/profile/profile_page.dart';
import 'package:finaceiro/feactures/stats/stats_page.dart';
import 'package:finaceiro/feactures/walltet/wallet_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          WalletPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.green, // Cor do botão
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white, // Ícone branco
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          CustomBottomAppBar(selectedItemColor: AppColors.green, children: [
        CustomBottomAppBarItem(
          label: 'home',
          primaryIcon: Icons.home,
          secondaryIcon: Icons.home_outlined,
          onPressed: () => pageController.jumpToPage(
            0,
          ),
        ),
        CustomBottomAppBarItem(
          label: 'stats',
          primaryIcon: Icons.analytics,
          secondaryIcon: Icons.analytics_outlined,
          onPressed: () => pageController.jumpToPage(
            1,
          ),
        ),
        CustomBottomAppBarItem(
          label: 'wallet',
          primaryIcon: Icons.account_balance_wallet,
          secondaryIcon: Icons.account_balance_wallet_outlined,
          onPressed: () => pageController.jumpToPage(
            2,
          ),
        ),
        CustomBottomAppBarItem(
          label: 'profile',
          primaryIcon: Icons.person,
          secondaryIcon: Icons.person_outlined,
          onPressed: () => pageController.jumpToPage(
            3,
          ),
        ),
      ]),
    );
  }
}
