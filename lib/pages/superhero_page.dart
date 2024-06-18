import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

import '../widgets/action_button.dart';

class SuperheroPage extends StatelessWidget {
  final String name;
  const SuperheroPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperheroesColors.background,
      body: SafeArea(child: Stack(
        children: [
          Center(
            child: Text(name, style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActionButton(
              text: "Back",
              onTap: () { Navigator.of(context).pop(); },
            ),
          )
        ],
      )),

    );
  }
}
