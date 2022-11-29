import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imgList = [
    'images/sample_movie.png',
    'images/sample_movie2.png',
    'images/sample_movie3.png'
  ];

  final List<String> _imgList2 = [
    'images/sample_movie4.png',
    'images/sample_movie5.png',
    'images/sample_movie6.png'
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("images/sample_slider.png"),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Now Playing",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 16, bottom: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imgList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(_imgList[index]),
                  );
                })),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Popular",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 16),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imgList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(_imgList2[index]),
                  );
                })),
          )
        ]),
      ),
    ));
  }
}
