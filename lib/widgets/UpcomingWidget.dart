import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  late List listResponse = [];

  void setUpData() async {
    var headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzQ2N2FkNzFjZjQ0MDViMzJmNDk1MTIzNmFkOTlhMiIsInN1YiI6IjY1MjY4M2E2ZWE4NGM3MDBjYTBlOWM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VFOAOgt88QL_M3zEq31KQRNjO5jUI8i0DYS2VBeE5Wo'
    };
    var dio = Dio();
    var response = await dio.request(
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=d7467ad71cf4405b32f4951236ad99a2',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      listResponse = response.data["results"];
      print(listResponse);

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
                'Top Rated Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text('See All',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < listResponse.length; i++)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/${listResponse[i]['poster_path']}",
                      height: 180,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
