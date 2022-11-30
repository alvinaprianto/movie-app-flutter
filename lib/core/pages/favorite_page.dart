import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/core/data/data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
              "Favorite",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          )),
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      moviesList[index].poster,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          moviesList[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 65, 65, 65)),
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
                              moviesList[index].rating.toString(),
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
                              moviesList[index].genre,
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
                              moviesList[index].year,
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
                              moviesList[index].duration,
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
            );
          })),
    );
  }
}
