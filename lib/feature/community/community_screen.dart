import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
TODO: 공통 탑 헤더 파일 별도 분리 하기? 
=> 나의 똑닥, 커뮤니티, 마이페이지 전부 같은 공통헤더 같으나
스크롤 할때도 체킹 필요, 마이페이지는 iOS NavigationController에서 제공하는 기능으로 구현한듯?
*/
class CommunityScreen extends ConsumerWidget {
  CommunityScreen({super.key});

  final _tabList = [
    "전체",
    "아이가 아파요🤒",
    "아토피맘 공감🫧",
    "성장발달 고민👶🏻",
    "육아•일상📝",
    "이벤트🎁"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '커뮤니티',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 15),
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
                      Icons.sentiment_dissatisfied,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          TabBar(
            tabs: _tabList
                .map((title) => Tab(
                      text: title,
                    ))
                .toList(),
            isScrollable: true, // If you want the tabs to be scrollable
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.black,
                ),
              ],
            ),
          ),
          //      _tabList.map((title) {
          //       return SingleChildScrollView(
          //         padding: const EdgeInsets.symmetric(vertical: 20),
          //         child: Container(
          //           margin: const EdgeInsets.symmetric(vertical: 20),
          //           //alignment: Alignment.topLeft,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               const Text(
          //                 '[세뱃돈 이벤트] 설 연휴에 뭐 하세요? 이번 설 연휴 어디서 무얼 하며 지내시는지 댓글',
          //                 textAlign: TextAlign.left,
          //                 style: TextStyle(fontSize: 16),
          //               ),
          //               const SizedBox(height: 10),
          //               Row(
          //                 children: [
          //                   Text(
          //                     '똑닥팀 • N분/시간/일 전',
          //                     textAlign: TextAlign.left,
          //                     style: TextStyle(
          //                       fontSize: 14,
          //                       color: Colors.black.withOpacity(0.3),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(height: 15),
          //               Row(
          //                 children: [
          //                   Icon(
          //                     Icons.favorite_outline_rounded,
          //                     size: 18,
          //                     color: Colors.black.withOpacity(0.3),
          //                   ),
          //                   const SizedBox(width: 5),
          //                   Text(
          //                     '좋아요 999',
          //                     style: TextStyle(
          //                       fontSize: 13,
          //                       color: Colors.black.withOpacity(0.3),
          //                     ),
          //                   ),
          //                   const SizedBox(width: 20),
          //                   Icon(
          //                     Icons.sms_outlined,
          //                     size: 18,
          //                     color: Colors.black.withOpacity(0.4),
          //                   ),
          //                   const SizedBox(width: 5),
          //                   Text(
          //                     '댓글 999',
          //                     style: TextStyle(
          //                       fontSize: 13,
          //                       color: Colors.black.withOpacity(0.4),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(height: 20),
          //               Divider(
          //                 thickness: 1.0,
          //                 color: Colors.black.withOpacity(0.2),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // ),
          // TODO: 로드모어 Expanded()
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                    30), // Half of the height for an ellipse
                color: Colors.yellow,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, -2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_sharp,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    '글쓰기',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
