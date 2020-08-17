/*
*IMPORTANT: When working with jsonAPIs, it is important to take not of what type your response returns e.g list or oject.
* Since our payload returns a list of objects, we first need to get the list, before working with the objects
* The first step is getting the list
*
* This class must have a list passed to it on instantiation*/
class PostList {
  final List<Post> posts;

  PostList({this.posts});

  /*
  * We need to retrieve this list from the JSON API and make this list into a dart object
  * we will pass a list in this case because we receive a list of objects so it can be List<Post>
  */
  factory PostList.fromJson(List<dynamic> parsedJson){
    List<Post> posts = new List<Post>();
//    convert each object in our list into an actual dart oject and map it to the Post.fromJson obect
//    we then convert all the objects created to a single list. Making it a list of dart objects
    posts = parsedJson.map((e) => Post.fromJson(e)).toList();

//    we now return a PostList which is the main constructor, then pass the posts fetched and parsed above.
    return new PostList(posts: posts);
  }
}

/*
* Handling the second step of the data which is each object which is each post item*/
class Post {

  int userId;
  int id;
  String title;
  String body;

//  when the constructor parameters are placed inside braces, they become named parameters
//  this means that u need to pass their name before assigning a value
//  e.g. Post(userId:1, id:1, title:"thete", body:"therlkfja")
  Post({this.userId, this.id, this.title, this.body});

  /*
  * We now have the fields in our model but we need to map the json fields to the model fields
  * We do that by creating a factory named constructor.
  * We use the factory keyword for the constructor creation is so that when we implement the constructor,
  * it won't always create a new instance of its class, because object instances are very expensive in programming.
  *
  * Map<String, dynamic> The String represents the key type in the json object while the dynamic represents the value type
  * the value type is dynamic because the value does not have a specific type for each data in the object.
  * if the key and value were sure to be both string we could use <String, String>
  * so this is just implementing the Map<key, value> */

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
//      get the userId from json and map to the userId for the post etc.
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }


}