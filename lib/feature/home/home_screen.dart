import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'banner.dart';
// 다른 파일에서 호출하면 에러난다.
//import 'searchbar.dart';
//import 'package:children_remote_reservation_app/feature/home/searchbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double imageWidth = MediaQuery.of(context).size.width - 40;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(FontAwesomeIcons.locationCrosshairs),
                          SizedBox(width: 10),
                          Text(
                            '가산동',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.people_outline),
                          SizedBox(width: 15),
                          Icon(Icons.star_outline),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SearchBar(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            //ImageSliderDemo(),
            const BannerWidget(),
            const SizedBox(height: 20),
            GreyContainer(
              imageWidth: imageWidth,
              containerHorizontal: 20,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '실시간 투표 진행 중',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '요즘 가장 핫한 대화 주제는?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.bar_chart,
                    color: Colors.yellow,
                    size: 55,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GreyContainer(
                    imageWidth: imageWidth / 2 - 5,
                    height: 70,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '동네 인기 병원',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.local_fire_department,
                          color: Color.fromARGB(255, 211, 46, 34),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  GreyContainer(
                    imageWidth: imageWidth / 2 - 5,
                    height: 70,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '지금 문연 병원',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.light,
                            color: Color.fromARGB(255, 40, 69, 183), size: 30),
                      ],
                    ),
                  ),
                  // imageWidth / 2 - 10  35
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: imageWidth,
              height: 100,
              color: Colors.blue.withOpacity(0.5),
            ),

            const SubTitle(title: '진료과로 병원 찾기 🏥'),
            const SubTitle(title: '이런 병원 찾고 계신가요?'),

            Container(
              color: Colors.black,
              height: 1000,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}

class Department {
  final IconData icon;
  final String name;

  Department({required this.icon, required this.name});
}

class HorizontalListView extends StatelessWidget {
  final List<Department> departments = [
    Department(icon: Icons.child_care, name: '소아청소년과'),
    Department(icon: Icons.favorite, name: '이비인후과'),
    Department(icon: Icons.house, name: '가정의확과'),
    Department(icon: Icons.favorite, name: '산부인과'),
    Department(icon: Icons.vibration, name: '내과'),
    Department(icon: Icons.video_call, name: '정형외과'),
    Department(icon: Icons.tiktok, name: '피부과'),
    Department(icon: Icons.tiktok, name: '안과'),
    Department(icon: Icons.tiktok, name: '정신건강의학과'),
  ];

  final List<IconData> images = [];

  final List<IconData> imageList;

  HorizontalListView({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Icon(
                  imageList[index],
                  size: 30,
                )),
          ),
        );
      },
    );
  }
}

class SubTitle extends StatelessWidget {
  final String title;

  const SubTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class GreyContainer extends StatelessWidget {
  final double imageWidth;
  final double height;
  final Widget child;
  final double containerHorizontal;

  const GreyContainer({
    Key? key,
    required this.imageWidth,
    this.height = 100,
    required this.child,
    this.containerHorizontal = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: imageWidth,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.3)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: containerHorizontal),
          child: child,
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.07),
          prefixIcon: const Icon(Icons.search),
          hintText: '질병, 진료과, 병원을 검색해보세요.',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        onChanged: (value) {
          print('Search query: $value');
        },
      ),
    );
  }
}
