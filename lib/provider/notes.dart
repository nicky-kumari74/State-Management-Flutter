import 'package:flutter/material.dart';
import 'package:state_management/provider/dbHelper.dart';



class Notes extends StatelessWidget{
  final DBHelper dbHelper= DBHelper();
  var title=TextEditingController();
  var desc=TextEditingController();
  List<Map<String, dynamic>> notes = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Notes'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Title'
                  ),
                ),
                Container(height: 40,),
                TextField(
                  controller: desc,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Desc'
                  ),
                ),
                Container(height: 40,),
                ElevatedButton(onPressed: addNote,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,    // change background color for better visibility.
                        padding: EdgeInsets.only(left: 120,right: 120,top: 11,bottom: 11),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    child: Text("Add",)
                )
              ],
            ),
          ),
        )
    );
  }
  void addNote() async{
    print('hello');
    final ttl=title.text;
    final ds=desc.text;
    await dbHelper.addNotes(ttl, ds);
    loadNotes();

  }
  void loadNotes() async{
    final data=await dbHelper.getNotes();
    notes=data;
    print("hello");
    print(notes);
  }
}