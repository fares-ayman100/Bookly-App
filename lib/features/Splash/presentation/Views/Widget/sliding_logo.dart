import 'package:flutter/widgets.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({super.key, required this.slidingAnimatino});

  final Animation<Offset> slidingAnimatino;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimatino,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimatino,
          child: Image.asset('assets/images/logo.png'),
        );
      },
    );
  }
}
