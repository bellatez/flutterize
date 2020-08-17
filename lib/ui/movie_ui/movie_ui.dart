import 'package:flutter/material.dart';
import 'package:learnflutter/model/Movie.dart';

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

//  The key in the constructor allows flutter to control how one widget replaces another widget in a tree
//  If need be in the tree we want to replace this widget with another everything is setup with the key
//  The curly braces in the parameters is to show that it is optional. you can pass it as well as u can leave it empty
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieName),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: ListView(
          children: [
            MovieDetailsThumbnail(thumbnail: movie.Images[0]),
            MovieDetailsHeaderWithPoster(movie: movie),
            HorizontalLine(),
            MovieDetailsCast(movie: movie),
            HorizontalLine(),
            MovieExtraPosters(posters: movie.Images)
          ],
        )
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.white)
          ],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
        )
      ],
    );
  }
}
class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Row(
        children: [
          MoviePoster (poster: movie.Images[0].toString()),
          SizedBox(width:16.0),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}
class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.Year} . ${movie.Genre}".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan),),
        Text(movie.Title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32.0),),
        Text.rich(
            TextSpan(
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300),
                children: <TextSpan>[
                  TextSpan(
                      text: movie.Plot
                  ),
                ]
            )
        )
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.Actors),
          MovieField(field: "Directors", value: movie.Director),
          MovieField(field: "Awards", value: movie.Awards)
        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field :", style: TextStyle(
            color: Colors.black38,
            fontSize: 12.0,
            fontWeight: FontWeight.w300
        )),
        Expanded(
          child: Text(value, style: TextStyle(
              color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w300
          )),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieExtraPosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text("More Movies Posters".toUpperCase(), style: TextStyle(fontSize: 14.0, color: Colors.black26)),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
//              The seperator builder is just to build what seperates the items
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]), fit: BoxFit.cover)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}