import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsing extends StatefulWidget {
  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  Future data;

//  Since the build method is called many times within your apps lifecycle,
//  It is not advisable to call anything that requires data fetching inside the method
//  Because it will flood the UI with calls that does not pertain to it and it is bad practice

//  The init state is where things happen before the UI is rendered
//  whenever we have certain data that the app needs before the app is loaded, we do it in the method/state
//  The initstate runs just once when the app is ran so when u perform a hot reload it does not call this method
//  because it just rebuilds the UI and not the entire application
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Json Parsing")
      ),
      body: Center(
        child: Container(
//          use futurebuilder which is a promise with the builder is the resolve
          child: FutureBuilder(
//            you have to pass the data source in the future attribute to let the builder know which data to build
              future: getData(),
//              the builder takes the context as well as the data which you can call snapshot for eg
//          the snapshot can take an optional type like the asyncsnapshot which takes the parameter type
//          dynamic  means the type to expect can be anything from list to model etc.
//          it can be written as AsyncSnapshot<dynamic> or just AsyncSnapshot
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
//                snapshot.data returns a dynamic type in this case. so snapshot.data is like doing snapshot.then((data)

//                return Text(snapshot.data[0]['title']);
//              when returning the data it works in the app but returns an error just to let us know something can always
//              go wrong because we are fetching data from a source we have no control over so we have to manage that aspect
//              In this case we can check if the data is available by using the hasData method which returns a boolean if data is available
                 if(snapshot.hasData) {
//                   If we try to get the Id which is an integer, it returns an error that since Text widget takes just String
//                 Text(snapshot.data[0]['id'].toString());
//                 or display the data in quotes
//                   return Text("${snapshot.data[0]['title']} ${snapshot.data[0]['id']}");

                  return createListView(snapshot.data, context);
                 }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  Future getData() async {
    var data;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    data = Network(url).fetchData();
    //    printing the data returns Future<dynamic> because d data is a future so we have to wait to make sure the data is ready
//    so it does not know whether it has been ready
//    print(data);
//    using the then keyword (a promise) means that after the future gets data, if the promise resolves, it can now give us
//    the data it got from the response and we can now access the various objects
//    data.then((value) => {
//      print(value[0]['title'])
//    });
    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text(data[index]['title']),
              subtitle: Text(data[index]['body']),
              leading: CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 23,
                child: Text(data[index]['id'].toString()),
              ),
            )
          ],
        );
      }),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print(url);
//    it is advisabe to pass the url inside the Uri.encodeFull()
//    It is a good idea to account for the additional elements in the url like an id or an unwanted space
//    which otherwise the wont be interpreted correctly
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
//      the body is a string so we cant get the objects in it so we have to use json.decode we takes the string at converts
//    back to json e.g response.body[0] returns nothing since it cant read objects because it is a string
//      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
