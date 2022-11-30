import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/core/data/data.dart';
import 'package:movie_app/core/pages/detail_page.dart';
import 'package:movie_app/core/pages/home_page.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../models/movies.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<Movies> listSearch = [];

  @override
  void initState() {
    super.initState();
    listSearch.addAll(moviesList);
  }

  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Search Film",
            // textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 225, 225, 225),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical(y: 0),
                controller: _searchController,
                autofocus: false,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withAlpha(0)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withAlpha(0)),
                  ),
                  hintText: "Cari film ?",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        listSearch.clear();
                        listSearch = moviesList
                            .where((element) => element.title
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))
                            .toList();
                      });
                      _focusNode.unfocus();
                    },
                    icon: ImageIcon(
                        Svg('images/nav_search.svg', size: Size(20, 20))),
                  ),
                ),
              ),
            ),
          ),
          listSearch.isEmpty
              ? Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3.3),
                    // height: double.infinity,
                    child: Image(
                      alignment: Alignment.topCenter,
                      image: Svg("images/search_null.svg"),
                      height: 40,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: listSearch.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (() {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => DetailMovie(
                            //               movie: moviesList[index],
                            //             ))));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    listSearch[index].poster,
                                    height: 130,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        listSearch[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 65, 65, 65)),
                                      ),
                                      SizedBox(width: 0.0, height: 12),
                                      Row(
                                        children: <Widget>[
                                          ImageIcon(
                                              Svg(
                                                "images/star_icon.svg",
                                              ),
                                              size: 20,
                                              color: Color(0xFFFF8700)),
                                          SizedBox(width: 8, height: 0.0),
                                          Text(
                                            listSearch[index].rating.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFF8700)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          ImageIcon(
                                            Svg("images/genre_icon.svg"),
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(width: 8, height: 0.0),
                                          Text(
                                            listSearch[index].genre,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          ImageIcon(
                                            Svg("images/duration_icon.svg"),
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(width: 8, height: 0.0),
                                          Text(
                                            listSearch[index].year,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          ImageIcon(
                                            Svg("images/duration_movie.svg"),
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          SizedBox(width: 8, height: 0.0),
                                          Text(
                                            listSearch[index].duration,
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
