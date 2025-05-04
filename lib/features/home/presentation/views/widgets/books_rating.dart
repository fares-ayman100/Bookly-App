import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksRating extends StatelessWidget {
  const BooksRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '19.99 €',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffffdd4f)),
        SizedBox(width: 6.3),
        Text('4.8', style: Styles.textStyle16),
        SizedBox(width: 5),
        Text('(2390)', style: Styles.textStyle14),
      ],
    );
  }
}
