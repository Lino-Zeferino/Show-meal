import 'package:flutter/material.dart';

class MyAppBAr extends StatelessWidget {
  String title;
  bool isDetails;
  MyAppBAr({required this.title, required this.isDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8.0, 16, 0),
        child: Container(
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDetails)
                const BackButton(
                  color: Colors.white,
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (!isDetails)
                    Row(
                      children: const [
                        Icon(
                          Icons.place,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Luanda, Angola",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
