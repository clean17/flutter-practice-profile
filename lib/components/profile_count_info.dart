import 'package:flutter/material.dart';

class profileCountInfo extends StatelessWidget {
  const profileCountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfo("51","Posts"),
        _buildLine(),
        _buildInfo("10","Likes"),
        _buildLine(),
        _buildInfo("3","Share"),
      ],
    );
  }
}
Widget _buildLine() {
  return Container(
    width: 2,
    height: 60,
    color: Colors.lightBlue,
  );
}

Widget _buildInfo(String count, String title) {
  return Column(
    children: [
      Text(count,
        style: TextStyle(
            fontSize: 15),),
      Text(title)
    ],
  );
}