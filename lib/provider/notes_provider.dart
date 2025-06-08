import 'package:flutter/foundation.dart';
import 'package:state_management/provider/dbHelper.dart';

class NotesProvider with ChangeNotifier{
  final DBHelper _helper= DBHelper();
  List<Map<String,dynamic>> _notes=[];

  List<Map<String,dynamic>> get notes => _notes;

  Future<void> loadNotes() async{
    _notes= await _helper.getNotes();
    notifyListeners();
  }
  Future<void> addNotes(String title,String desc) async{
    await _helper.addNotes(title, desc);
    _notes= await _helper.getNotes();
    notifyListeners();
  }
}