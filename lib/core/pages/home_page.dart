import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/core/data/movies_data.dart';

import '../widgets/carousel_custom.dart';
import '../widgets/list_movies_home.dart';
import '../widgets/section_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imgList2 = [
    'https://imgur.com/wAEnSXN.png',
    'https://imgur.com/k2CIc6T.png',
    'https://imgur.com/a1l9Xvy.png'
  ];

  final List<String> _imgList = [
    'https://imgur.com/L68FtMA.png',
    'https://imgur.com/6hdrj8h.png',
    'https://imgur.com/jJgLB51.png'
  ];

  final List<String> _sliderList = [
    'https://imgur.com/lweGxbJ.png',
    'https://imgur.com/gqTRTyL.png',
    'https://imgur.com/NeB2R69.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hai, Alvin !",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Apa yang kamu ingin tonton ?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
          CarouselCustom(sliderList: _sliderList),
          const SectionTitle(
            title: "Now Playing",
          ),
          ListMoviesHome(listMovie: moviesList),
          const SectionTitle(
            title: "Popular",
          ),
          ListMoviesHome(listMovie: moviesList),

          // ListMoviesHome(imgList: _imgList2)
        ]),
      ),
    ));
  }
}
