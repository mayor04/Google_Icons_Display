import 'package:flutter/material.dart';
import 'package:google_icon_saver/data/icon_data.dart';

class SearchVm extends ChangeNotifier {
  List? searchList;
  String runParams = '';

  Future<void> search(String params) async {
    print('###Started search $params');
    //This searches for the icons that includes the requires string

    runParams = params;
    int len = params.length;

    //this prevent janking while typing due to large computation
    //this waits till the user finishes typing
    await Future.delayed(Duration(milliseconds: 3000));
    if (runParams != params) {
      print('###Ended search $params');
      return;
    }

    if (len == 0) {
      searchList = null;

      //notify if there is no string in the search so as to display the whole item
      notifyListeners();
      return;
    }

    searchList = [];
    for (var i = 0; i < googleIconList.length; i++) {
      //search occurs when onChanges is called in a textField
      //which means it will be called as soon as the user inputs a new letter
      //we only need result for the current search
      //so all other search function are stoped if it is not the current search
      if (runParams != params) {
        print('###Ended search $params');
        return;
      }
      bool isPresent = checkStringJoined(googleIconList[i][0]);

      if (isPresent) {
        searchList?.add(googleIconList[i]);
        print('added ${googleIconList[i][0]} $params');
      }
    }

    //notify when the search is done;
    notifyListeners();
    print('###Ended search $params');
    return;
  }

  checkStringJoined(String iconName) {
    return iconName.contains(runParams);
  }

  bool checkIndividualString(String iconName) {
    for (var i = 0; i < runParams.length; i++) {
      if (!iconName.contains(runParams[i])) {
        return false;
      }
    }
    return true;
  }
}
