import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 10,
          leading: IconButton(
            icon: const Icon(
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
              "Detail",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  width: double.infinity,
                  child: Image.asset(
                    "images/banner_spiderman.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    left: 40,
                    bottom: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              //   boxShadow: [
                              //   BoxShadow(
                              //       spreadRadius: 1,
                              //       blurRadius: 1,
                              //       color: Color.fromARGB(255, 187, 187, 187),
                              //       offset: Offset(0, 1))
                              // ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.asset("images/poster_spiderman.png"),
                        ),
                        const SizedBox(width: 10, height: 0.0),
                        Container(
                          width: MediaQuery.of(context).size.width - 180,
                          child: const Text(
                            "Spiderman",
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Expanded(
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10, height: 0.0),
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
                    Expanded(
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10, height: 0.0),
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
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 20),
            // Container(
            //   width: 100,
            //   height: 100,
            //   child: DefaultTabController(
            //     initialIndex: 1,
            //     length: 3,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const TabBar(
            //           tabs: <Widget>[
            //             Tab(
            //               text: "Text(data)",
            //               icon: Icon(Icons.cloud_outlined),
            //             ),
            //             Tab(
            //               icon: Icon(Icons.beach_access_sharp),
            //             ),
            //             Tab(
            //               icon: Icon(Icons.brightness_5_sharp),
            //             ),
            //           ],
            //         ),
            //         const TabBarView(
            //           children: <Widget>[
            //             Center(
            //               child: Text("It's cloudy here"),
            //             ),
            //             Center(
            //               child: Text("It's rainy here"),
            //             ),
            //             Center(
            //               child: Text("It's sunny here"),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
