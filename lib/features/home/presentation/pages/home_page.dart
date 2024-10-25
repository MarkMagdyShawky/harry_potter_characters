import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:harry_potter/features/home/presentation/widgets/offline_widget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/widgets/custom_blue_loading_widget.dart';
import '../../data/models/character.dart';
import '../cubit/characters_cubit.dart';
import '../widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Character> searchesCharacters = [];
  late List<Character> allCharacters;
  bool _isSearching = false;
  TextEditingController _textEditingController = TextEditingController();

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _textEditingController.clear();
      searchesCharacters = allCharacters;
    });
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.clear,
            color: MyColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search_rounded,
            color: MyColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
      ];
    }
  }

  void _updateSearchResults(String searchTerm) {
    setState(() {
      searchesCharacters = allCharacters
          .where((character) => character.name.toLowerCase().startsWith(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customedAppBar(
        title: kHarryP,
        isSearching: _isSearching,
        colorsList: [MyColors.kSkyBlueColor, MyColors.kPinkColor],
        textEditingController: _textEditingController,
        allCharacters: allCharacters,
        buildAppBarActions: _buildAppBarActions(),
        onSearch: _updateSearchResults,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected = !connectivity.contains(ConnectivityResult.none);
          if (!connected) {
            return const Center(child: OfflineWidget());
          } else {
            return BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoading) {
                  return const CustomBlueLoadingWidget();
                } else if (state is CharactersLoaded) {
                  final characters = state.characters; //* Get characters from the loaded state
                  return HomePageBody(
                      onSearch: _updateSearchResults,
                      searchesCharacters: searchesCharacters,
                      allCharacters: characters,
                      textEditingController: _textEditingController);
                }
                return const SizedBox.shrink();
              },
            );
          }
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
