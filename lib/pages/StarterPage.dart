import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/animations/FadeAnimation.dart';
import 'package:fooddeliveryapp/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class Starterpage extends StatefulWidget {
  const Starterpage({super.key});

  @override
  State<Starterpage> createState() => _StarterpageState();
}

class _StarterpageState extends State<Starterpage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then(
          (f) => Navigator.push(
              context,
              PageTransition(
                  child: const HomePage(), type: PageTransitionType.fade)),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Starter-image.jpeg"),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.2),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  0.5,
                  const Text(
                    "Taking Order For Faster Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1.0,
                  const Text(
                    "See resturants nearby by\n adding location",
                    style: TextStyle(
                        color: Colors.white, height: 1.4, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  1.2,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Colors.yellow, Colors.orange],
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 50),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            print("Button clicked");
                            _onTap();
                          },
                          child: const Text(
                            "Start",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.4,
                  AnimatedOpacity(
                    opacity: _textVisible ?1.0:0.0,
                    duration: const Duration(milliseconds: 50),
                    child: const Align(
                      child: Text(
                        "Now Deliver To Your Door 24/7",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
