import 'package:flutter/material.dart';
import 'package:graphql_api/widgets/CustomNavBar.dart';
import 'package:graphql_api/widgets/MoviePageButtons.dart';


class MovieDetail extends StatelessWidget {
  final list;
  const MovieDetail({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Movie'),
      //   backgroundColor: Colors.white10,
      // ),
      
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.network(
                "https://image.tmdb.org/t/p/original/${list['poster_path']}",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 8)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${list['poster_path']}",
                              height: 250,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red.withOpacity(0.5),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                )
                              ]),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MoviePageButtons(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list['original_title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              'Synopsis',
                              style: TextStyle(color: Colors.white54),
                            )
                          ],
                        ),
                        Text(
                          list['overview'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
