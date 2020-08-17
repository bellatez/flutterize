import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:learnflutter/model/Post.dart';

/*
the method of  fetching json data as seen in the json_parsing.dart is good when working with payload is simple
* but when the data becomes complicated like it is too long or nested data, we are prone to make spelling errors,
* or other kinds of errors.
*The solution for this is to create Plain Old Dart Object(PODO) which is the model class that mimics the data object fields.
* In this way u just access the data using the model_name.the_data_attribute_name.
* e.g. Instead of data[0]['title'] you will now do Post.title
*/
class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network('https://jsonplaceholder.typicode.com/posts');
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON PODO"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
              builder: (context, AsyncSnapshot<PostList> snapshot){
            List<Post> allPost;
            if(snapshot.hasData){
              allPost = snapshot.data.posts;
              return createListView(allPost, context);
            } else {
              return CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
  Widget createListView(List<Post> data, BuildContext context) {
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
                  title: Text(data[index].title),
                  subtitle: Text(data[index].body),
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 23,
                    child: Text(data[index].id.toString()),
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
  Future<PostList> loadPosts() async {
    final response = await get(Uri.encodeFull(url));

    if(response.statusCode == 200){
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to get posts");
    }
  }
}
