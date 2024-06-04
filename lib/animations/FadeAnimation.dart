// import 'package:flutter/material.dart';
// import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

// class FadeAnimation extends StatefulWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child, {required Text child});

//   @override
//   _FadeAnimationState createState() => _FadeAnimationState();
// }

// class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
//  late SequenceAnimation _sequenceAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(vsync: this);

//     _sequenceAnimation = SequenceAnimationBuilder()
//       .addAnimatable(
//         animatable: Tween(begin: 0.0, end: 1.0),
//         from: Duration(milliseconds: (500 * widget.delay).round()),
//         to: Duration(milliseconds: (500 * widget.delay + 500).round()),
//         tag: "opacity",
//       )
//       .addAnimatable(
//         animatable: Tween(begin: 30.0, end: 0.0),
//         from: Duration(milliseconds: (500 * widget.delay).round()),
//         to: Duration(milliseconds: (500 * widget.delay + 500).round()),
//         tag: "translateX",
//         curve: Curves.easeOut,
//       )
//       .animate(_controller);

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Opacity(
//           opacity: _sequenceAnimation["opacity"].value,
//           child: Transform.translate(
//             offset: Offset( _sequenceAnimation["translateX"].value,0),
//             child: widget.child,
//           ),
//         );
//       },
//       child: widget.child,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _sequenceAnimation = SequenceAnimationBuilder()
      .addAnimatable(
        animatable: Tween(begin: 0.0, end: 1.0),
        from: Duration(milliseconds: (500 * widget.delay).round()),
        to: Duration(milliseconds: (500 * widget.delay + 500).round()),
        tag: "opacity",
      )
      .addAnimatable(
        animatable: Tween(begin: 30.0, end: 0.0),
        from: Duration(milliseconds: (500 * widget.delay).round()),
        to: Duration(milliseconds: (500 * widget.delay + 500).round()),
        tag: "translateY",
        curve: Curves.easeOut,
      )
      .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _sequenceAnimation["opacity"].value,
          child: Transform.translate(
            offset: Offset(0, _sequenceAnimation["translateY"].value),
            child: widget.child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

