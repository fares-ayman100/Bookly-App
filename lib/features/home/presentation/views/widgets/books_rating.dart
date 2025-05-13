import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksRating extends StatelessWidget {
  const BooksRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, 
  });
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(size: 15, FontAwesomeIcons.solidStar, color: Color(0xffffdd4f)),
        SizedBox(width: 6.5),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
