import 'package:aula10/module/SushiClass.dart';
import 'package:aula10/view/details/My_appBar.dart';
import 'package:flutter/material.dart';

import 'details/detailsList.dart';

const cardColor = Color(0xFF151f2b);
const fundo = Colors.black;

class ShowMealsPage extends StatelessWidget {
  Sushi item;

  ShowMealsPage({
    required this.item,
  });
  bool isDetails = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: size.width * .85,
              height: size.height * .9,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [fundo, cardColor.withOpacity(.5)],
                    stops: const [.2, 1]),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -.5),
            child: Hero(
              tag: ObjectKey(item.name),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(item.img), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .54),
            child: SushiLisinfoWidget(item, isDetails),
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
                  Icons.add,
                ),
                onPressed: () {},
              ),
            ),
          ),
          MyAppBAr(
            title: item.name,
            isDetails: isDetails,
          ),
        ],
      ),
    );
  }
}
