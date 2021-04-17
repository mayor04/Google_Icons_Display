import 'package:flutter/material.dart';
import 'package:google_icon_saver/utils/Design.dart';

class TopBar extends StatefulWidget {
  TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    Map map = {};
    map.keys;

    return Container(
      height: 50,
      color: Design.green,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Text(
            'Google-Icons',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.bookmark,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
