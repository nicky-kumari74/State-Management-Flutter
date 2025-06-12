import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/dbHelper.dart';
import 'package:state_management/provider/notes_provider.dart';

class updateNotes extends StatelessWidget {
  final DBHelper dbHelper = DBHelper();
  var title = TextEditingController();
  var desc = TextEditingController();
  String t;
  String d;
  var indx;
  List<Map<String, dynamic>> notes = [];
  updateNotes(this.t,this.d,this.indx);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    title.text=t;
    desc.text=d;
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Notes'),
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
                ElevatedButton(onPressed: () {
                  final ttl = title.text;
                  final ds = desc.text;
                  Provider.of<NotesProvider>(context,listen: false).updatenotes(indx, ttl, ds);
                  //Provider.of<NotesProvider>(context,listen: false).addNotes(ttl, ds);
                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        // change background color for better visibility.
                        padding: EdgeInsets.only(
                            left: 120, right: 120, top: 11, bottom: 11),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))
                    ),
                    child: Text("Update",)
                )
              ],
            ),
          ),
        )
    );
  }
}