import 'package:flutter/material.dart';
import 'package:learnflutter/model/Application.dart';

class MainMenu extends StatelessWidget {

  List appList = Application.getApplications();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Choose App to Begin"),
        centerTitle: true,
        elevation: 5,
        actions: [
          Icon(Icons.settings)
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: appList.length,
          itemBuilder: (context, int index){
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.red.shade400),
              child: ListTile(
                leading: Icon(Icons.apps),
                title: Text(appList[index].appName, style: TextStyle(color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w300)),
                subtitle: Text(appList[index].description, style: TextStyle(color: Colors.white38, fontSize: 15.0)),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>appList[index].widgetName)),
              ),
            );
        }),
      ),
    );
  }
}
