import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<(IconData, String)> lists = [
  (Icons.present_to_all, '이벤트·투표'),
  (Icons.people, '가족관리'),
  (Icons.favorite, '건강피드'),
  (Icons.star, '찜한 병원'),
];

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  //
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  //
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      '마이페이지',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: const Center(
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // TODO: 나의 관리부터 시작
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth,
                  height: 130,
                  child: ItemList(screenWidth: screenWidth),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final double screenWidth;

  //const ItemList({Key? key}) : super(key: key);
  const ItemList({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 가변 길이 = 전체 가로 길이 - padding(양쪽, 부모도 계산) - item 간격 패딩(전체 갯수 - 1/마지막 제외)
    double itemWidth = (screenWidth - 60 - 60) / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            (IconData, String) item = lists[index];
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: itemWidth,
                      height: itemWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.$1,
                        size: itemWidth / 2 - 10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      item.$2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                if (index != lists.length) const SizedBox(width: 20),
              ],
            );
          }),
    );
  }
}
