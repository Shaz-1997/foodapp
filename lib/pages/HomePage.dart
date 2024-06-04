import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_basket))
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    1,
                    Text(
                      "Food Delivery",
                      style: TextStyle(
                          color: Colors.grey[80],
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                            1, makeCategories(isActive: true, title: 'Pizza')),
                        FadeAnimation(1.3,
                            makeCategories(isActive: false, title: 'Burgers')),
                        FadeAnimation(1.4,
                            makeCategories(isActive: false, title: 'Kebab')),
                        FadeAnimation(1.5,
                            makeCategories(isActive: false, title: 'Desert')),
                        FadeAnimation(1.6,
                            makeCategories(isActive: false, title: 'Salads')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FadeAnimation(
                1,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpeg')),
                  FadeAnimation(1.2, makeItem(image: 'assets/images/two.jpg')),
                  FadeAnimation(
                      1.6, makeItem(image: 'assets/images/three.jpg')),
                ],
              ),
            ))
          ],
        )));
  }

  Widget makeCategories({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.0 / 1,
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: isActive ? Colors.yellow[700] : Colors.white,
              borderRadius: BorderRadius.circular(50)),
          child: Align(
            child: Text(
              title,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey[500],
                  fontSize: 18,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
            ),
          )),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  0.2,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ])),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
