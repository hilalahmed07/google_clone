// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatefulWidget {
  final String link;
  final String text;
  final String linkToGo;
  final String desc;

  const SearchResultComponent({
    super.key,
    required this.link,
    required this.text,
    required this.linkToGo,
    required this.desc,
  });

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderLine = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.link,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              if (await canLaunch(widget.linkToGo)) {
                await launch(widget.linkToGo);
              }
            },
            onHover: (hovering) {
              setState(() {
                _showUnderLine = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff202124),
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blueColor,
                    decoration: _showUnderLine ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.desc,
          style: const TextStyle(
            fontSize: 14,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
