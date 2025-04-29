import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/models/character.dart';

class CharacterItem extends StatelessWidget {

  final Character character;
  CharacterItem({required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColor.White,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, characterDetailsScreenRoute,
              arguments: character);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetail(character: character,)));
        },
        child: Hero(
          tag: character.id,
          child: GridTile(
            footer: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color:Colors.redAccent,
          
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColor.White,
                  fontSize: 16,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: Container(
              color: MyColor.Gray,
              child:character.image.isNotEmpty?
               FadeInImage.assetNetwork(placeholder:'assets/images/loadingIcon.gif' ,
               image: character.image ,fit: BoxFit.cover,)
              :Image.network('https://i.sstatic.net/y9DpT.jpg',fit: BoxFit.cover,),
            ),
            
          ),
        ),
      ),
    );
  }
}

/*
child: Card(
        child: Column(
          children: [
            Image.network(
              'https://cdn.mos.cms.futurecdn.net/JzJYjvq6QfVsiw6q6JzVj4.jpg',
              fit: BoxFit.cover,
            ),
            Text('Character Name'),
          ],
        ),
      ),
 */
