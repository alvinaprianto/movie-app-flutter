import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/core/pages/detail_page.dart';
import 'package:movie_app/core/pages/home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 10,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey,
            ),
            onPressed: (() {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text(
              "Search Film",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 220, 220, 220),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Search film",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 65, 65, 65)),
                ),
                ImageIcon(Svg('images/nav_search.svg', size: Size(20, 20)))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => DetailMovie())));
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12),
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "images/sample_movie_7.png",
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Spiderman",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 65, 65, 65)),
                                ),
                                SizedBox(width: 0.0, height: 12),
                                Row(
                                  children: const <Widget>[
                                    ImageIcon(
                                        Svg(
                                          "images/star_icon.svg",
                                        ),
                                        size: 20,
                                        color: Color(0xFFFF8700)),
                                    SizedBox(width: 8, height: 0.0),
                                    Text(
                                      "9.5",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFF8700)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const <Widget>[
                                    ImageIcon(
                                      Svg("images/genre_icon.svg"),
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8, height: 0.0),
                                    Text(
                                      "Action",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const <Widget>[
                                    ImageIcon(
                                      Svg("images/duration_icon.svg"),
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8, height: 0.0),
                                    Text(
                                      "2019",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const <Widget>[
                                    ImageIcon(
                                      Svg("images/duration_movie.svg"),
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8, height: 0.0),
                                    Text(
                                      "139 minutes",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          )
        ]),
      ),
    );
  }
}
