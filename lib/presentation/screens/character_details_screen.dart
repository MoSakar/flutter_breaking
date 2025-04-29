import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';
import 'package:flutter_breaking/data/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;
  const CharacterDetail({super.key, required this.character});

Widget _buildAppBar(){
  return SliverAppBar(
    expandedHeight: 600,
    stretch: true,
    pinned: true,
    
    // backgroundColor:MyColor.Gray,
    backgroundColor: MyColor.Yellow,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(
      character.name,
      style: TextStyle(
        color: MyColor.White,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
      background: Hero(
        tag: character.id,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/loadingIcon.gif',
          image: character.image,
          fit: BoxFit.cover,
        ),
      ),
    ),

  );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColor.Gray,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${character.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Occupation: ${character.gender}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Status: ${character.status}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 1000),
      
                  ],
                ),
              ),
            ]
          ))
            
            
            
        ],
      ),
    );
  }
}