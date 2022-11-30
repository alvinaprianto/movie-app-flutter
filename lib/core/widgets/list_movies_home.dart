import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/core/data/data.dart';
import 'package:movie_app/core/models/movies.dart';
import 'package:movie_app/core/pages/detail_page.dart';

class ListMoviesHome extends StatelessWidget {
  const ListMoviesHome({
    Key? key,
    required List<Movies> this.listMovie,
  }) : super(key: key);

  final List<Movies> listMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 16, right: 16),
          scrollDirection: Axis.horizontal,
          itemCount: listMovie.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailMovie(
                              movie: moviesList[index],
                              index: index,
                            )));
              },
              child: Container(
                margin: EdgeInsets.only(right: 16),
                width: MediaQuery.of(context).size.width / 3.3,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      listMovie[index].poster,
                      fit: BoxFit.cover,
                      loadingBuilder: ((context, child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }),
                    )),
              ),
            );
          })),
    );
  }
}
