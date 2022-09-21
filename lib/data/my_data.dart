import 'dart:math';

import 'package:aula10/module/SushiClass.dart';

// ignore: non_constant_identifier_names
final MYTADA = [
  Sushi(
    img: "images/1.jpg",
    name: "Sutam witai",
    prece: 17.32 * (Random().nextInt(6) + 4),
    star: Random().nextInt(6),
  ),
  Sushi(
    img: "images/4.jpg",
    name: "Riton SSui",
    star: Random().nextInt(6),
    prece: 17.32 * (Random().nextInt(6) + 4),
  ),
  Sushi(
      img: "images/3.jpg",
      name: "carzh buit",
      prece: 17.32 * (Random().nextInt(6) + 4),
      star: Random().nextInt(6)),
  Sushi(
      img: "images/2.jpg",
      name: "Yurdt hutis",
      prece: 17.32 * (Random().nextInt(6) + 4),
      star: Random().nextInt(6)),
  Sushi(
      img: "images/Cachorro Quente.PNG",
      name: "Cachorro Quente",
      prece: 17.32 * (Random().nextInt(6) + 4),
      star: Random().nextInt(6)),
  Sushi(
      img: "images/Batatas fritas.PNG",
      name: "Batatas fritas",
      prece: 17.32 * (Random().nextInt(6) + 4),
      star: Random().nextInt(6)),
  Sushi(
    img: "images/Fango no forno com molho delicioso.PNG",
    name: "Fango no forno",
    prece: 17.32 * (Random().nextInt(6) + 4),
    star: Random().nextInt(6),
  ),
  Sushi(
    img: "images/Frango frito americano do KFC.jpg",
    name: "Frango do KFC",
    prece: 17.32 * (Random().nextInt(6) + 4),
    star: Random().nextInt(6),
  ),
  Sushi(
    img: "images/Hamburguer.PNG",
    name: "Hamburguer",
    prece: 17.32 * (Random().nextInt(6) + 4),
    star: Random().nextInt(6),
  ),
];
