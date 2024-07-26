import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

class SuperheroCard extends StatelessWidget {
  final SuperheroInfo superheroInfo;
  final VoidCallback onTap;

  const SuperheroCard(
      {super.key, required this.onTap, required this.superheroInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: SuperheroesColors.grayBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              color: Colors.white24,
              child: CachedNetworkImage(
                  imageUrl: superheroInfo.imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: const Color.fromRGBO(0, 188, 212, 1),
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) => Center(
                    child: Image.asset(
                          'assets/images/unknown.png',
                          width: 20,
                          height: 62,
                          fit: BoxFit.cover,
                        ),
                  )),
            ),
            //Image.network(superheroInfo.imageUrl , width: 70, height: 70, fit: BoxFit.cover,),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    superheroInfo.name.toUpperCase(),
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    superheroInfo.realName,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
