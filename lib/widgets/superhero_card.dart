import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

class SuperheroCard extends StatelessWidget {
  final String name;
  final String realName;
  final String imageUrl;
  final VoidCallback onTap;

  const SuperheroCard({super.key, required this.name, required this.realName, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: SuperheroesColors.grayBackground,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Image.network(imageUrl , width: 70, height: 70, fit: BoxFit.cover,),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.toUpperCase(), style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  Text(realName, style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
