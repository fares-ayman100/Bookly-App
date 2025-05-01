import 'package:flutter/widgets.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimatino});

  final Animation<Offset> slidingAnimatino;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimatino,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimatino,
          child: Text('Read Free Books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
