import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/notes.dart';
import 'package:state_management/provider/notes_provider.dart';
import 'package:state_management/provider/update_notes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home",),
      ),
      body: Consumer<NotesProvider>(
          builder: (ctx,provider,__){
            List<Map<String,dynamic>> notes=provider.notes;
            return notes.isEmpty?Center(child: Text("No Notes yet!!"),):
                ListView.builder(
                  itemCount: notes.length,
                    itemBuilder: (_,indx){
                      return ListTile(
                        leading: Text('${indx+1}'),
                        title: Text(notes[indx]['title']),
                        subtitle: Text(notes[indx]['desc']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>updateNotes(notes[indx]['title'],notes[indx]['desc'],notes[indx]['id'])));
                            },
                                icon: Icon(Icons.edit,color: Colors.blue,size: 20,)
                            ),
                            IconButton(onPressed: (){
                              Provider.of<NotesProvider>(context,listen: false).deletenotes(notes[indx]['id']);
                            },
                                icon: Icon(Icons.delete,color: Colors.blue,size: 20,)
                            )
                          ],
                        ),
                      );
                    }
                );
          }
      ),

      /*body: Center(
        child: Consumer<CounterProvider>(
            builder: (ctx,_,__){
              return Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(fontSize: 20),);
            }
        ),
        //child: Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(fontSize: 20),),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes()));
          //Provider.of<CounterProvider>(context,listen: false).increamentCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
