import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
              indicatorWeight: 3,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "Tentang"),
                Tab(text: "Ulasan"),
                Tab(text: "Pemain"),
              ],
              labelColor: Colors.black,
            ),
          ),
          Expanded(
            // color: Colors.amber,
            //Add this to give height
            // height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(
                    "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences."),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.brown,
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "6.3",
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                            SizedBox(width: 12, height: 0.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Iqbal Ramadhan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: Image.asset("images/tom_holland.png"),
                          ),
                          Text("Tom Holland")
                        ],
                      );
                    })),
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
                color: Colors.grey,
              ),
              onPressed: (() {
                Navigator.pop(context);
                // Navigator.push(
                // context, MaterialPageRoute(builder: (context) => HomePage()));
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
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: _tabSection(context),
            ),
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Stack(
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
                                child:
                                    Image.asset("images/poster_spiderman.png"),
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
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
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
                ),
                // SliverToBoxAdapter(child: SizedBox(width: 0.0, height: 20)),

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
              ];
            })));
  }
}
