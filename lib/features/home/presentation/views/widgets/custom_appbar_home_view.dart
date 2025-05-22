import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarHomeView extends StatelessWidget {
  const CustomAppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsData.logo, height: 35),
        Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouters.kSearchView);
          },
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          iconSize: 25,
        ),
      ],
    );
  }
}
