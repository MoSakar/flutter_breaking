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
  List<Character>? allCharacters;
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
  
  

  Widget buildListView(){
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          buildCharacterList(),
        ],),
      ),
    );
  }

  Widget buildCharacterList(){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    childAspectRatio: 2/3,
    crossAxisSpacing: 1.0,
    mainAxisSpacing: 1.0,
    
    ),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemBuilder: (ctx, index){
      return CharacterItem();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: buildBolcWidget(),
    );
  }
}
