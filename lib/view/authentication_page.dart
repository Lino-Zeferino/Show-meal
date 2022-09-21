import 'package:aula10/data/utlil%20value/standard.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  List<String> data = [];
  late String senhaAux;
  bool isPassword = false;
  bool isDigit = false;
  tamanho() {
    return data.length;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 130,
              color: Standard().myColor,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/images/EXPRESS.png"),
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "PIN do serviço MULTICAIXA",
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              // color: Colors.amber,
              width: size.width * .8,
              height: size.height * .4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            data.add("1");
                            Senha();
                          });
                        },
                        child: MyButton("1"),
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            data.add("2");
                            Senha();
                          });
                        },
                        child: MyButton("2"),
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("3");
                              Senha();
                            });
                          },
                          child: MyButton("3")),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("4");
                              Senha();
                            });
                          },
                          child: MyButton("4")),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            data.add("5");
                            Senha();
                          });
                        },
                        child: MyButton("5"),
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("6");
                              Senha();
                            });
                          },
                          child: MyButton("6")),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("7");
                              Senha();
                            });
                          },
                          child: MyButton("7")),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            data.add("8");
                            Senha();
                          });
                        },
                        child: MyButton("8"),
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("9");
                              Senha();
                            });
                          },
                          child: MyButton("9")),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .16,
                      ),
                      GestureDetector(
                          onTap: () {
                            data.clear();
                            print(data.length);
                          },
                          child: MyButtonDel("DEL")),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add("0");
                              Senha();
                            });
                          },
                          child: MyButton("0")),
                      SizedBox(
                        width: size.width * .05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Senha() {
    int i = 1;
    if (data.length == 6) {
      print("senha igual a 6");
      senhaAux = data[0].toString() +
          data[1].toString() +
          data[2].toString() +
          data[3].toString() +
          data[4].toString() +
          data[5].toString();
      if (senhaAux == Standard().password) {
        isPassword = true;
        data.clear();
      } else {
        isPassword = false;
        data.clear();
      }
    }
  }

  Widget MyButton(number) {
    return Container(
      height: 55,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.black45,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget MyButtonDel(tex) {
    return Container(
      height: 55,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.black45,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          tex,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
