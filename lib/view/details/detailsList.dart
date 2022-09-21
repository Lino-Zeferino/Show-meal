import 'dart:math';
import 'package:aula10/module/SushiClass.dart';
import 'package:flutter/material.dart';

class SushiLisinfoWidget extends StatelessWidget {
  final Sushi item;
  bool isDetails;
  SushiLisinfoWidget(this.item, this.isDetails);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        if (!isDetails)
          Text(
            item.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) {
                bool select = index <= item.star;
                return Icon(
                  Icons.star,
                  color: select ? Colors.white70 : Colors.white24,
                  size: 16,
                );
              },
            ),
          ),
        ),
        TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: item.prece,
            ),
            duration: const Duration(milliseconds: 500),
            builder: (context, prece, child) {
              return Text(
                "\$${prece.toInt()}",
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              );
            }),
        if (isDetails)
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 50),
            child: Container(
              height: 100,
              color: Colors.white10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Random().nextInt(8) + 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        right: 8,
                      ),
                      child: Container(
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.amber),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.food_bank_outlined,
                                size: 42,
                              ),
                              Text(
                                "itrediente ${index}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )),
                    );
                  }),
            ),
          ),
      ],
    ));
  }
}
