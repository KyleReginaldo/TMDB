import 'package:damovie/presentation/cubit/choose_genre_cubit/choose_genre_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/pages/genre_page.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../cubit/search/search_cubit.dart';
import 'favorite_page.dart';
import 'search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/design/colors.dart';
import '../../dipendency_injection.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider<ChooseGenreCubit>(
                        create: (context) => sl<ChooseGenreCubit>(),
                      ),
                      BlocProvider<HomeCubit>(
                        create: (context) => sl<HomeCubit>(),
                      ),
                    ],
                    child: const GenrePage(),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(top: 6, right: 8, bottom: 6),
              child: const CustomOswaldText(
                text: 'Genres',
                color: WHITE,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: BLACK.withOpacity(0.5),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<SearchCubit>(
                      create: (context) => sl<SearchCubit>(),
                      child: const SearchPage(),
                    ),
                  ),
                );
              },
            ),
            // const SearchWidget(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(builder: ((context, state) {
                if (state is HomeInitial) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: const HomePage(),
                  );
                }
                return const SizedBox.shrink();
              }))
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: BLACK.withOpacity(0.3),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/images/tmdb.png',
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [TEAL, ALICE_BLUE, Color(0xFF508871), GREEN],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                height: 5,
                width: 250,
              ),
              ListTile(
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<FavoriteCubit>(
                          create: (context) =>
                              sl<FavoriteCubit>()..getFavorites(),
                          child: const FavoritePage(),
                        ),
                      ),
                    );
                  },
                  child: const CustomOswaldText(
                    text: 'Favorites',
                    color: WHITE,
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
