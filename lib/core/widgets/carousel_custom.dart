import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselCustom extends StatelessWidget {
  const CarouselCustom({
    Key? key,
    required List<String> sliderList,
  })  : _sliderList = sliderList,
        super(key: key);

  final List<String> _sliderList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _sliderList.map((e) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  e,
                  fit: BoxFit.cover,
                  loadingBuilder:
                      ((context, child, ImageChunkEvent? loadingProgress) {
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
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(180),
                    Color.fromARGB(0, 0, 0, 0)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            )
          ],
        );
      }).toList(),
      options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          enlargeCenterPage: true),
    );
  }
}
