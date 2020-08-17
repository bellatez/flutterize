import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/model/Movie.dart';
import 'package:learnflutter/util/hexcolor.dart';

import 'movie_ui/movie_ui.dart';

//stateless apps
class ScaffoldExample extends StatelessWidget {
  _tapButton() => debugPrint("tap Button");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email Tapped")),
          IconButton(
              icon: Icon(Icons.access_alarm), onPressed: () => _tapButton())
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Text(
                "Tap me!",
                style: TextStyle(fontSize: 23.4),
              ),
              onTap: () => debugPrint("Tapped like this"),
            ),
            CustomButton()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.call_merge),
        onPressed: () => debugPrint("hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Edit Account")),
          BottomNavigationBarItem(
              icon: Icon(Icons.threed_rotation), title: Text("Visit site")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("cool off"))
        ],
        onTap: (int index) => debugPrint(
            "Tapped item $index"), //since more than one item exist we access them with their indices
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Gesture detector"),
          backgroundColor: Colors.amber,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.amberAccent.shade700,
            borderRadius: BorderRadius.circular(8.0)),
        child: Text("Open Snackbar"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*    Material component knows how to structure everything to make it look good
*   e.g. it adds the white background by default without which the bg will be black
  */
    return Material(
      color: Colors.deepOrange,
      child: Center(
//      add the text direction attribute when using text widget in a non directionality widget like center
//    for the compiler to know how to render the text so as not to give an error
        child: Text(
          "hello There!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350.0,
      height: 200.0,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.cyan.shade700,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ben Darillo",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.white)),
          Text("darillotextile@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("T: @getyourtextilecreated")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.blue, width: 1.2),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/300/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}

//Stateful apps
//Lynspire app
class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Life is about making an impact, not making an income. --Kevin Kruse",
    "Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",
    "Strive not to be a success, but rather to be of value. –Albert Einstein",
    "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.  –Robert Frost",
    "You miss 100% of the shots you don’t take. –Wayne Gretzky",
    "I've missed more than 9000 shots in my career. I've lost almost 300 games. 26 times I've been trusted to take the game winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed. –Michael Jordan",
    "The most difficult thing is the decision to act, the rest is merely tenacity. –Amelia Earhart",
    "Every strike brings me closer to the next home run. –Babe Ruth",
    "Definiteness of purpose is the starting point of all achievement. –W. Clement Stone",
    "Life isn't about getting and having, it's about giving and being. –Kevin Kruse",
    "Life is what happens to you while you’re busy making other plans. –John Lennon",
    "We become what we think about. –Earl Nightingale",
    "Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover. –Mark Twain",
    "Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll",
    "The most common way people give up their power is by thinking they don’t have any. –Alice Walker",
    "The mind is everything. What you think you become.  –Buddha",
    "The best time to plant a tree was 20 years ago. The second best time is now. –Chinese Proverb",
    "An unexamined life is not worth living. –Socrates",
    "Eighty percent of success is showing up. –Woody Allen"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lynspire"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade700,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//            we are adding the % quotes.length makes sure we don't exceed the length so anything greater gives just the remainder
//          This makes it such that the value will always be within range
            Expanded(
              child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5)),
                  child: Center(
                      child: Text(
                    quotes[_index % quotes.length],
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 18.0,
                        letterSpacing: 0.3),
                  ))),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      color: Colors.greenAccent.shade700,
                      onPressed: _showQuote,
                      icon: Icon(Icons.wb_sunny),
                      label: Text(
                        "Inspire me",
                        style: TextStyle(color: Colors.white, fontSize: 18.8),
                      )),
                  FlatButton.icon(
                      color: Colors.redAccent,
                      onPressed: () => debugPrint("Share quote"),
                      icon: Icon(Icons.share),
                      label: Text(
                        "Share",
                        style: TextStyle(color: Colors.white, fontSize: 18.8),
                      )),
                ],
              ),
            ),
//            The bigger the spacer the more space we will have at the bottom of the screen
            Spacer()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("My Profile")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_comment), title: Text("Add Quote")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text("Join Group")),
        ],
      ),
    );
  }

  _showQuote() {
//    increment index counter by 1
    setState(() {
      _index += 1;
    });
  }
}

//Bill Splitter app
class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per Person", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0, color: _purple)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}", style: TextStyle(fontSize: 34.9, fontWeight: FontWeight.bold, color: _purple)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.blueGrey.shade100, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.0),

              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: TextStyle(color: Colors.grey.shade700),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter > 1)
                                  _personCounter--;
                                else{

                                }

                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(child: Text("-", style: TextStyle(color: _purple, fontWeight: FontWeight.bold, fontSize: 17.0),)),
                            ),
                          ),
                          Text("$_personCounter", style: TextStyle(color: _purple, fontSize: 17.0)),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(child: Text("+", style: TextStyle(color: _purple, fontSize: 17.0, fontWeight: FontWeight.bold))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip", style: TextStyle(color: Colors.grey.shade700)),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}", style: TextStyle(color: _purple, fontWeight: FontWeight.bold, fontSize: 17.0)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("$_tipPercentage %", style: TextStyle(color: _purple, fontSize: 17.0, fontWeight: FontWeight.bold)),
                      Slider(
                        min: 0,
                        max: 100,
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
//                        divisions: 20,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double value){
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        }
                      ,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty){

    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Cinemania extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("CineMania"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
//        if you don't pass the count it returns an infinite list of items
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:[
//                put the card first so that the image sits ontop of the card
                  movieCard(movieList[index], context),
//                position widget lets u adjust the placement of the widget on top of the other
                  Positioned(
                      top: 10,
                      child: movieImage(movieList[index].Images[0])
                  ),
                ]
            );
          }
      ),
    );
  }
  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left:50.0),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(movie.Title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white))
                        ),
                        Text("Rating: ${movie.imdbRating} / 10", style: mainTextStyle())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Released: ${movie.Released}", style: mainTextStyle()),
                        Text(movie.Runtime, style: mainTextStyle()),
                        Text(movie.Rated, style: mainTextStyle())
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              //       the materialPageroute tells the compiler how to handle the stateless widget view for the next page
              //       It is also responsible for the back arrow button found on the appbar of the view
              MaterialPageRoute(
                  builder: (context) =>
                      MovieListViewDetails(movieName: movie.Title, movie: movie)
              )
          );
        }
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }
  Widget movieImage(String imageUrl, ){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ?? 'https://picsum.photos/536/354'),
              fit: BoxFit.cover
          )
      ),
    );
  }
}











