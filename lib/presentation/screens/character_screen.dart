import 'package:flutter/material.dart';
import 'package:flutter_breaking/business_logic/cubit/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/data/models/character.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchCharaterResult;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          searchCharaterResult = allCharacters
              .where((character) =>
                  character.name.toLowerCase().startsWith(value.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
           _stopSearching();
              // searchCharaterResult = allCharacters;
              Navigator.pop(context);
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: _startSearch,
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)?.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: _stopSearching,
      ),
    );
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      isSearching = false;
      searchController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getCharacters();
  }

  Widget buildBolcWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is Characterloaded) {
        allCharacters = state.characters;
        return buildListView();
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildListView() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchController.text.isNotEmpty
          ? searchCharaterResult.length
          : allCharacters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: searchController.text.isNotEmpty
              ? searchCharaterResult[index]
              : allCharacters[index],
        );
      },
    );
  }
 Widget buildAppBarTitle(){
  return Text(
    'Characters',
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),

      ),
      body: buildBolcWidget(),
    );
  }
}
