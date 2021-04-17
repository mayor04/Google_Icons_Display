import 'package:flutter/material.dart';
import 'package:google_icon_saver/data/icon_data.dart';
import 'package:google_icon_saver/screens/home/home_widget.dart';
import 'package:google_icon_saver/utils/Design.dart';
import 'package:google_icon_saver/view_model/search_vm.dart';
import 'package:google_icon_saver/widget/icons_wrap.dart';
import 'package:google_icon_saver/widget/top_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          SizedBox(height: 30),
          SearchBar(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 30, 20, 14),
            child: Text(
              'All',
              style: TextStyle(
                color: Design.darkTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: body(),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Consumer<SearchVm>(
      builder: (_, searchVm, c) {
        List? search = searchVm.searchList;
        List iconList = search == null ? googleIconList : search;

        int len = iconList.length;
        if (len == 0) {
          return Center(
            child: Text(
              'No Icon was found for the search',
              style: TextStyle(
                color: Design.darkTextColor,
                fontSize: 20,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: (len / 4).ceil(),
          itemBuilder: (_, pos) {
            int end = pos * 4 + 4;
            end = end >= len ? len : end;
            return IconRow(
              fourIcons: iconList.getRange(pos * 4, end),
            );
          },
        );
      },
    );
  }
}
