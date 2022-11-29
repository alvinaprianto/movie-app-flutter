import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final Map<String, String> _actors = {
    "images/tom_holland.png": "Tom Holland",
    "images/zendaya.png": "Zendaya",
    "images/benedict.png": "Benedict Cumberbatch",
    "images/jacob_batallon.png": "Jacob Batallon"
  };

  final Map<String, dynamic> _reviews = {
    "Mr. Beast": [
      "9.0",
      "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences."
    ],
    "Michael": ["8.4", "It's the best movie all of the time!"],
    "John": [
      "7.4",
      "Wow this is great! But i dont like the ending, so sad!",
    ],
  };
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: const TabBar(
              indicatorWeight: 3,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "About"),
                Tab(text: "Review"),
                Tab(text: "Actor"),
              ],
              labelColor: Color.fromARGB(255, 32, 27, 27),
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              const Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(
                  "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
                  style: TextStyle(
                    height: 1.4,
                  ),
                ),
              ),
              ListView(
                children: _reviews.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.brown,
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  e.value[0],
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(width: 12, height: 0.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.key,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    e.value[1],
                                    style: const TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 222, 222, 222),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: _actors.entries.map(
                      (e) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child: Image.asset(e.key),
                            ),
                            const SizedBox(width: 0.0, height: 8),
                            Text(e.value.toString())
                          ],
                        );
                      },
                    ).toList()),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 10,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: (() {
                Navigator.pop(context);
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
        body: NestedScrollView(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: _tabSection(context),
            ),
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 60),
                        width: double.infinity,
                        child: Image.asset(
                          "images/banner_spiderman2.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                          left: 34,
                          bottom: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Image.asset(
                                  "images/poster_spiderman2.png",
                                  height: 110,
                                ),
                              ),
                              const SizedBox(width: 10, height: 0.0),
                              Container(
                                width: MediaQuery.of(context).size.width - 180,
                                child: const Text(
                                  "Spiderman No Way Home",
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
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                SliverToBoxAdapter(
                  child: IntrinsicHeight(
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
                          SizedBox(width: 4, height: 0.0),
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
                          ImageIcon(
                            Svg("images/duration_icon.svg"),
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 4, height: 0.0),
                          Text(
                            "2021",
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
                          ImageIcon(
                            Svg("images/duration_movie.svg"),
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 4, height: 0.0),
                          Text(
                            "148 minutes",
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
                ),
              ];
            })));
    // return Scaffold(
    //   appBar: AppBar(
    //       leadingWidth: 10,
    //       leading: IconButton(
    //         icon: const Icon(
    //           Icons.arrow_back_ios_outlined,
    //           color: Colors.black,
    //         ),
    //         onPressed: (() {
    //           Navigator.pop(context);
    //         }),
    //       ),
    //       backgroundColor: Colors.white,
    //       elevation: 0,
    //       title: const Center(
    //         child: Text(
    //           "Detail",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               fontSize: 17,
    //               fontWeight: FontWeight.w500,
    //               color: Colors.black),
    //         ),
    //       )),
    // );
  }
}
