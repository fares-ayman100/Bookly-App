import 'package:bookly_app/features/home/presentation/views/widgets/hom_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: HomeViewBody()));
  }
}
