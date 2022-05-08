import 'package:damovie/core/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/search/search_cubit.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _controller = TextEditingController();
  void submitQuery() {
    context.read<SearchCubit>().searchMovies(query: _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DARKGREY,
      child: TextField(
        controller: _controller,
        style: GoogleFonts.oswald(
          color: WHITE,
        ),
        onSubmitted: (controller) {
          submitQuery();
        },
        decoration: InputDecoration(
          hintText: 'Search movies',
          hintStyle: GoogleFonts.oswald(
            color: WHITE,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: TEAL, width: 1),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: GREEN, width: 1),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                submitQuery();
                setState(() {});
              },
            ),
          ),
          prefixIcon: IconButton(
            color: WHITE,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
