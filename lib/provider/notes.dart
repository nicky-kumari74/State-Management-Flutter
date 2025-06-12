import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/dbHelper.dart';
import 'package:state_management/provider/notes_provider.dart';



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
                ElevatedButton(onPressed: (){
                  final ttl=title.text;
                  final ds=desc.text;
                  Provider.of<NotesProvider>(context,listen: false).addNotes(ttl, ds);
                },
                    style: ElevatedButton.styleFrom(
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
}