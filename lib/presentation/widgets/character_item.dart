import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}