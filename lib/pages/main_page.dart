import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/resources/superheroes_colors.dart';
import 'package:superheroes/resources/superheroes_images.dart';
import 'package:superheroes/widgets/action_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bloc,
      child: const Scaffold(
        backgroundColor: SuperheroesColors.background,
        body: SafeArea(child: MainPageContent()),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context);
    return Stack(
      children: [
        const MainPageStateWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: ActionButton(
            text: "Next state",
            onTap: () => bloc.nextState(),
          ),
        )
      ],
    );
  }
}

class MainPageStateWidget extends StatelessWidget {
  const MainPageStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context);
    return StreamBuilder<MainPageState>(
      stream: bloc.observeMainPageState(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }
        final MainPageState state = snapshot.data!;
        switch (state) {
          case MainPageState.loading:
            return const LoadingIndicator();
          case MainPageState.minSymbols:
            return const MinSymbolsWidget();
          case MainPageState.noFavorites:
            return const NoFavoritesWidget();
          case MainPageState.nothingFound:
          case MainPageState.loadingError:
          case MainPageState.searchResults:
          case MainPageState.favorites:
          default:
            return Center(
              child: Text(
                state.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
        }
      },
    );
  }
}

/// LOADING INDICATOR
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: CircularProgressIndicator(
          color: SuperheroesColors.blue,
          strokeWidth: 4,
        ),
      ),
    );
  }
}

/// MIN SYMB WIDGET
class MinSymbolsWidget extends StatelessWidget {
  const MinSymbolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Text(
          "Enter at least 3 symbols",
          style: GoogleFonts.openSans(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// NO FAV WIDGET
class NoFavoritesWidget extends StatelessWidget {
  const NoFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                    color: SuperheroesColors.blue,
                    borderRadius: BorderRadius.circular(100)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Image.asset(
                  SuperheroesImages.ironMan,
                  width: 108,
                  height: 119,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "No favorites yet",
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
            "Search and add".toUpperCase(),
            style: GoogleFonts.openSans(
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ActionButton(onTap: () {}, text: "Search")
        ],
      ),
    );
  }
}
