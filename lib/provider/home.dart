import 'package:flutter/material.dart';
import 'package:state_management/provider/notes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home2",),
      ),
      body: Center(
        /*child: Consumer<CounterProvider>(
            builder: (ctx,_,__){
              return Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(fontSize: 20),);
            }
        ),*/
        //child: Text('${Provider.of<CounterProvider>(context,listen: true).getCount()}',style: TextStyle(fontSize: 20),),
      ),
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
