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
  Future<void> updatenotes(int id,String newtitle,String newdesc) async{
    var res= await _helper.updateNotes(id, newtitle, newdesc);
    print("response : $res");
    if(res==1){
      _notes=await _helper.getNotes();
      notifyListeners();
    }

  }
  Future<void> deletenotes(int id) async {
    var res = await _helper.deleteNotes(id);
    print("response : $res");
    if (res == 1) {
      _notes = await _helper.getNotes();
      notifyListeners();
    }
  }
}