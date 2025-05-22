import 'dart:async';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/Search/presentation/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        BlocProvider.of<SearchCubit>(context).fetchSearchBook(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          enabledBorder: builderOutlineInputBorder(),
          focusedBorder: builderOutlineInputBorder(),
          hintText: 'Search',
          hintStyle: Styles.textStyle18,
          suffixIcon: Opacity(
            opacity: .7,
            child: IconButton(
              onPressed: () {
                final query = controller.text;
                if (query.isNotEmpty) {
                  FocusScope.of(
                    context,
                  ).unfocus();
                  BlocProvider.of<SearchCubit>(context).fetchSearchBook(query);
                }
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
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
