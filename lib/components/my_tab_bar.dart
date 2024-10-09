import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).colorScheme.primary,
      child: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            text: 'Your Purchases',
          ),
          Tab(
            text: 'Products',
          ),
        ],
      ),
    );
  }
}