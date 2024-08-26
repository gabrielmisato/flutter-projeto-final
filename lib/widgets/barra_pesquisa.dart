import 'package:flutter/material.dart';

class BarraPesquisa extends StatelessWidget {
  const BarraPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          label: Text('O que você está pensando em cozinhar?'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
