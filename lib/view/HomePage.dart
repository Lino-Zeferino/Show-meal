// ignore_for_file: file_names

import 'package:aula10/data/my_data.dart';
import 'package:aula10/module/SushiClass.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'details/My_appBar.dart';
import 'details/detailsList.dart';
import 'show_meals_page.dart';

const cardColor = Color(0xFF151f2b);
const fundo = Colors.black;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Sushi> items = MYTADA;
  late Sushi _selectItem;
  late PageController _controller;
  double scrollOffset = 0.0;
  void navigatorToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (contex) => ShowMealsPage(
          item: _selectItem,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: .65,
    );
    _controller.addListener(() {
      setState(() => scrollOffset = _controller.page!);
    });
    _selectItem = items.first;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                    stops: const [.2, 1]),
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _selectItem = items[index];
              });
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              double alignment =
                  math.exp(-math.pow(scrollOffset - index, -4) / items.length);
              bool fromLeft = scrollOffset.round() > index;

              return Align(
                alignment: Alignment(0, alignment),
                child: Transform.rotate(
                  angle: fromLeft ? (alignment * .6) : -(alignment * .6),
                  child: GestureDetector(
                    onTap: () => navigatorToDetailsPage(context),
                    child: Hero(
                      tag: ObjectKey(items[index].name),
                      child: Container(
                        width: 170 - alignment * 5,
                        height: 170 - alignment * 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(items[index].img),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .7),
            child: SushiLisinfoWidget(_selectItem, false),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.visibility_outlined,
                ),
                onPressed: () => navigatorToDetailsPage(context),
              ),
            ),
          ),
          MyAppBAr(
            title: "Show Meals",
            isDetails: false,
          )
        ],
      ),
    );
  }
}
