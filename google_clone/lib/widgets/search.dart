// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/google-logo.png',
          height: size.height * 0.12,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width > 768 ? size.width * 0.4 : size.width * 0.9,
          child: TextFormField(
            onFieldSubmitted: (query) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(
                  searchQuery: query,
                  start: '0',
                ),
              ));
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: searchBorder,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/images/search-icon.svg',
                  color: searchBorder,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/mic-icon.svg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
