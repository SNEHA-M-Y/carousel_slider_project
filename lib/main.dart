import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final imageslist = [
  "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg",
  "https://housing.com/news/wp-content/uploads/2022/11/Calendula-FEATURE-compressed.jpg",
  "https://housing.com/news/wp-content/uploads/2023/03/Beautiful-pink-flowers-you-can-grow-in-your-garden-f.jpg",
  "https://www.marthastewart.com/thmb/J9_7YtrKi5R0fEpT1tClT6TVjlY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/dracula-monkey-face-orchid-0718-23c698bf2d7d4cada62ca2b2e7696084-horiz-0623-7213943b22454acca6fd40584c2e718b.jpg",
  'https://www.bhg.com/thmb/IKCuwee3OBN2OazbCyYw7nESa9s=/1866x0/filters:no_upscale():strip_icc()/popular-vday-flowers-red-roses-b571288385934e02b9f6bd9ddeef390a.jpg'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel slider Project',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Carousel Slider",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: imageslist.length,
              itemBuilder: (context, index, realIndex) {
                return Image.network(imageslist[index]);
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageslist.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
