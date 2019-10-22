import 'package:diginova4/model/naruto_model.dart';
import 'package:diginova4/services/naruto_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Naruto Movie"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(child: HomeBody()),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Daftar Movie",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          MovieList()
        ],
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<NarutoModel> listMovie;

  void loadData() {
    listMovie = List<NarutoModel>();
    NarutoServices.fetchData().then((onValue) {
      setState(() {
        listMovie = onValue;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return listMovie != null
        ? Container(
            child: ListView.builder(
              itemCount: listMovie.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, int index) {
                return Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 64,
                          width: 64,
                          child: Image.network(
                            listMovie[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              child: Text(
                                listMovie[index].title,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              child: Text(
                                listMovie[index].sinopsis,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
