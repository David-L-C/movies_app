import 'package:flutter/material.dart';
import 'movie.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children:<Widget> [
                Positioned(child: movieCard(movieList[index], context)),
                Positioned(top: 10.0,
                    child: movieImage(movieList[index].images[0])),
                ]
                );
          }
            ),
          );
    }
  }

Widget movieCard(Movie movie, BuildContext context) {
  return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          child: Card(
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,
                    bottom: 8.0,
                    left: 54.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(movie.title, style:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white
                            )
                          ),
                          Text("Rating: ${movie.imdbrating} / 10", style: mainTextStyle()
                          )
                          ]
                      )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Released: ${movie.released}", style: mainTextStyle()),
                          Text(movie.runtime, style: mainTextStyle()),
                          Text(movie.rated, style: mainTextStyle())
                        ],
                      ),
                )
                    ],
                  ),
                ),
              )
          );
}
TextStyle mainTextStyle() {
  return TextStyle(
          fontSize: 15.0,
          color: Colors.grey
  );
  }

Widget movieImage(String imageUrl) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(imageUrl, fit: BoxFit.cover)
  )
    ),
  );
  }


// New Route (screen)
class MovieListViewDetails extends StatelessWidget {
  
  final String movieName;
  final Movie movie;
  MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies ${this.movie}'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back"),
            onPressed: () {
            Navigator.pop(context);
            }
          ),
        ),
      ),
    );
  }
}

