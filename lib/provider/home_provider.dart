import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  List<String> folder = [];
  List<String>deleteRecord=[];

  void addNote(String note) {

    folder.add(note);
    notifyListeners();
  }

  void deleteNote(int index)


  {

    String deletedItems=folder.removeAt(index);
    deleteRecord.add(deletedItems);

    notifyListeners();



  }



}
