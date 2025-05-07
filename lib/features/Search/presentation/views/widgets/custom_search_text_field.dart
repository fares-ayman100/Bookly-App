import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: builderOutlineInputBorder(),
          focusedBorder: builderOutlineInputBorder(),
          hintText: 'Search',
          hintStyle: Styles.textStyle18,
          suffixIcon: Opacity(
            opacity: .7,
            child: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder builderOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
