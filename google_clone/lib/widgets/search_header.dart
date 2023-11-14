import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 15,
              top: 4,
            ),
            child: Image.asset(
              'assets/images/google-logo.png',
              height: 30,
              width: 92,
            ),
          ),
          const SizedBox(
            width: 27,
          ),
          Container(
            width: size.width * 0.45,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: searchColor,
              border: Border.all(
                color: searchColor,
              ),
            ),
            child: TextFormField(
              onFieldSubmitted: (query) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(searchQuery: query, start: '0'),
                  ),
                );
              },
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/mic-icon.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.search,
                        color: blueColor,
                      ),
                    ],
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
