import 'package:flutter/material.dart';
import 'package:google_icon_saver/utils/Design.dart';
import 'package:google_icon_saver/widget/min_container.dart';

class IconBox extends StatefulWidget {
  int code;
  String name;

  IconBox({
    Key? key,
    required this.code,
    required this.name,
  }) : super(key: key);

  @override
  _IconBoxState createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  @override
  Widget build(BuildContext context) {
    String widName = widget.name.replaceAll('_', ' ');
    widName = widName.length > 21 ? widName.substring(0, 18) + '...' : widName;

    return MinContainer(
      height: 91,
      width: 80,
      radius: 5,
      borderWidth: 0.5,
      borderColor: Design.border,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                IconData(widget.code, fontFamily: "MaterialIcons"),
                color: Design.darkTextColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
            height: 33,
            child: Text(
              widName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Design.darkTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  final Iterable fourIcons;
  const IconRow({Key? key, required this.fourIcons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getFourIcons(),
      ),
    );
  }

  List<Widget> getFourIcons() {
    List<Widget> iconWidget = [];
    fourIcons.forEach((element) {
      iconWidget.add(
        IconBox(
          code: element[1],
          name: element[0],
        ),
      );
    });

    return iconWidget;
  }
}
