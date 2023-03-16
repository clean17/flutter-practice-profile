import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {


   HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    // StatelessWidget 은 rebuild 할 수 있는 권한이 없다.
    // 컨버트해서 StatefulWidget 으로 바꿔야함 -> 상태가 있는 위젯
    print("또 실행됨");
    return Scaffold(
      appBar: AppBar(),
      body: Align( // 기본이 가운데 정렬
        // alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text("Hello ${num}", style: TextStyle(fontSize: 50),),
            // 버튼을 만드는 방법 3가지중 하나 p.148
            ElevatedButton(onPressed: (){
              setState(() { // 상태가 있는 위젯이 가지고 있는 함수
                num++; // 일단 이 모양으로 봐서는 변수를 넣어주면 변수를 찾아서 다시 그려주는듯..
              });
              print("num : ${num}"); // 화면은 변하지 않음. build 를 다시 그려야하는데 제어권이 없음 ( 프레임워크라서 )
              // 그럼 방법은 ? 방법은 있겠지 그럼.. 변한 부분만 그리는 방법은 ?
              // 변하는 부분을 build 위젯으로 만들어서 해당 부분만 다시 그리면 더 좋지
            }, child: Text("변경", style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
