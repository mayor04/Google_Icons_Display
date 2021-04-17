import 'package:flutter/material.dart';
import 'package:google_icon_saver/utils/Design.dart';
import 'package:google_icon_saver/view_model/search_vm.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  SearchVm? searchVm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: TextField(
        onChanged: (String searchText) {
          searchVm ??= Provider.of<SearchVm>(context, listen: false);

          searchText = searchText.trim();
          searchText = searchText.replaceAll(' ', '_');

          // Future.delayed(Duration(seconds: 20),);
          searchVm?.search(searchText);
          //
        },
        decoration: InputDecoration(
          filled: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Design.lightTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.search,
              color: Design.lightTextColor,
            ),
          ),
          fillColor: Design.lightWhite,
          border: Design.textFieldBorder(),
          enabledBorder: Design.textFieldBorder(),
          focusedBorder: Design.textFieldBorder(),
        ),
      ),
    );
  }
}
