import 'package:flutter/material.dart';
import 'package:projeto_final/widgets/barra_pesquisa.dart';

class PesquisaReceita extends StatelessWidget {
  const PesquisaReceita({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            BarraPesquisa(),
            Text('Texto para teste'),
          ],
        ),
      ),
    );
  }
}
