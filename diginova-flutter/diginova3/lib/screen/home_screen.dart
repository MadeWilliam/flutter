import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webtoon"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              "Category",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            ListCategory(),
            Text(
              "Daftar Komik",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            ListWebtoon()
          ],
        ),
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  List<String> categoryList = [
    "Horror",
    "Action",
    "Fantasy",
    "Thriller",
    "Adventure",
    "Slice of life",
    "Murder",
    "Magic",
    "Romance"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 100,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return Column(
            children: <Widget>[
              Icon(
                Icons.category,
                size: 25,
                color: Colors.black87,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left:10, right: 10),
                child: Center(
                  child: Text(
                    categoryList[index],
                    style: TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ListWebtoon extends StatelessWidget {
  List<dynamic> titleList = [
    "Stranger from hell",
    "Orange marmalade",
    "Bastard"
  ];
  List<dynamic> descriptionList = [
    "Menggambarkan suasana kosan yang mencekam",
    "Kisah cinta antara siswa remaja",
    "Sang psiko kembali dan menteror siapapun"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: titleList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10),
              color: Colors.pink[50],
              width: MediaQuery.of(context).size.width - 50,
              height: 120,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        "images/image${index + 1}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              descriptionList[index],
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
