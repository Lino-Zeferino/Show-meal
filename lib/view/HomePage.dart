import 'package:aula10/data/my_data.dart';
import 'package:aula10/module/SushiClass.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

final cardColor = Color(0xFF151f2b);
const fundo = Colors.black;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Sushi> items = MYTADA;

  late PageController _controller;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: .8,
    );
    _controller.addListener(() {
      setState(() => scrollOffset = _controller.page!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Show meals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(Icons.place),
                Text(
                  "Dining house",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      backgroundColor: fundo,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: size.width * .8,
              height: size.height * .9,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(size.width / 2),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [fundo, cardColor.withOpacity(.5)],
                    stops: [.2, 1]),
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: items.length,
            itemBuilder: (context, index) {
              double alignment =
                  math.exp(-math.pow(scrollOffset - index, -4) / items.length);
              bool fromLeft = scrollOffset.round() > index;
              return Align(
                alignment: Alignment(0, alignment + 0.5),
                child: Transform.rotate(
                  angle: fromLeft ? (alignment * .9) : -(alignment * .9),
                  child: Container(
                    width: 170 - alignment * 5,
                    height: 292 - alignment * 5,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(85),
                          child: Image.asset(
                            items[index].img,
                            fit: BoxFit.cover,
                            height: 160,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 2),
                          child: Text(
                            items[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15,
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            "\$${items[index].prece}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                  ),
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }
}
