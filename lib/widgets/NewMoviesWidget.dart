import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_api/MovieDetail.dart';
// ignore_for_file: avoid_print

class NewMoviesWidget extends StatefulWidget {
  const NewMoviesWidget({super.key});

  @override
  State<NewMoviesWidget> createState() => _NewMoviesWidgetState();
}

class _NewMoviesWidgetState extends State<NewMoviesWidget> {
  late List listResponses = [];

  void setUpData() async {
    var headers = {'Content-Type': 'application/json'};
    var data =
        '''{"query":"query {\\n  characters{\\n    results{\\n      id\\n      name\\n      image\\n      status\\n    }\\n  }\\n\\n  \\n}\\n","variables":{}}''';

    var dio = Dio();
    var response = await dio.request(
      'https://rickandmortyapi.com/graphql',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      listResponses = response.data["data"]["characters"]["results"];
      print(listResponses);

      // print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    // await instance.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Character List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < listResponses.length; i++)
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => MovieDetail(
                    //           list: listResponses[i],
                    //         ))
                    //         );
                    // Navigator.pushNamed(context, '/moviePage');
                  },
                  child: Container(
                    width: 190,
                    height: 300,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Color(0XFF292B37),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF292B37),
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            listResponses[i]['image'],
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listResponses[i]['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Text(
                                //   listResponses[i]['release_date'],
                                //   style: TextStyle(
                                //       color: Colors.white54,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w500),
                                // ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      listResponses[i]['status'].toString(),
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 16),
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}


// else {
//             return Center(child: CircularProgressIndicator());
//           }