import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/superheroes_colors.dart';
import 'action_button.dart';

class InfoWithButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String assetImage;
  final double imageHeight;
  final double imageWidth;
  final double imageTopPadding;

  const InfoWithButton(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.assetImage,
      required this.imageHeight,
      required this.imageWidth,
      required this.imageTopPadding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 108,
                width: 108,
                decoration: const BoxDecoration(
                    color: SuperheroesColors.blue, shape: BoxShape.circle),
              ),
              Padding(
                padding: EdgeInsets.only(top: imageTopPadding),
                child: Image.asset(
                  assetImage,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.openSans(
                fontSize: 32,
                height: 1.2,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle.toUpperCase(),
            style: GoogleFonts.openSans(
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ActionButton(onTap: () {}, text: buttonText)
        ],
      ),
    );
  }
}
