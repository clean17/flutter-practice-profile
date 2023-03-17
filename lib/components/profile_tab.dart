import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({Key? key}) : super(key: key);

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap>
    with SingleTickerProviderStateMixin {
  // 더 찾아보면 구현체를 찾을 수 있음

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // requied 매개변수 찾아서 들어가보니 TickerProvider 타입 변수가 필요
    // mixin 을 이용해서 타입은 해결했음
    // 한곳에만 쓰이는게 아니라서 전역으로 빼야함
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: _tabController, tabs: [
          Tab(
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
          ),
        ]),
        Expanded(
          // 여기랑 main 모두 Expanded 를 설정해줘야 함
          // 컬럼의 요소들은 모두 높이가 있어야함.. 탭바뷰는 높이를 알수 없기 때문에 나머지를 모두 차지하라고 익스펜디드 설정
          // 메인의 높이를 설정하더라도 내부의 요소가 외부보다 커지면 에러가 터짐.. 그래서 둘다 익스펜디드로 맞춤
          child: TabBarView(controller: _tabController, children: [
            GridView.builder(
                itemCount: 42,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  // print("실행 : ${index+1}"); // 이걸로 확인해보면 캐싱을 설정하지 않아서 뷰홀더에 15장만 다운받음
                  // 캐싱을 사용하지 않아서 15장을 초과하는 순서는 버리고 다시 다운받는 행위를 반복함
                  // return Image.network("http://picsum.photos/id/${index+1}/200/200");
                  return CachedNetworkImage(
                    imageUrl: "http://picsum.photos/id/${index + 1}/200/200",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                  Image.network("");
                }),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.grey,
            ),
          ]),
        )
      ],
    );
  }
}
