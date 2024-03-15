import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

/*
velog.io/@tygerhwang/Flutter-Tab-View-만들기2-PageView
*/

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  final _tabList = [
    "전체",
    "아이가 아파요🤒",
    "아토피맘 공감🫧",
    "성장발달 고민👶🏻",
    "육아•일상📝",
    "이벤트🎁"
  ];

  late TabController tabController = TabController(
    length: _tabList.length,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 500),
  );

  late DefaultTabController tabController2 =
      DefaultTabController(length: _tabList.length, child: _tabBar());

  @override
  void initState() {
    tabController.addListener(() {
      /// 프레임당 콜백
    });

    tabController.indexIsChanging;
    tabController.length;
    tabController.previousIndex;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _tabBar(),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black,
      overlayColor: const MaterialStatePropertyAll(
        Colors.transparent,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      // !!!: isScroll 때문에 처음과 끝에 margin 원치 않는 마진값이 생긴다.
      // 대신에 이걸 적용해야 라벨 사이즈 만큼 탭 크기가 늘어난다. => 특정 방법을 찾거나 Custom Tab을 그려야 한다.
      isScrollable: true,

      onTap: (index) {},
      tabs: _tabList.map((e) => Tab(text: e)).toList(),
    );
  }
}
