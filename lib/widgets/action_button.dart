import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ActionButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: SuperheroesColors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
    );
  }
}
