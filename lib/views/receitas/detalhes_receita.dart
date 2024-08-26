import 'package:flutter/material.dart';
import 'package:projeto_final/classes/receita.dart';
import 'package:projeto_final/widgets/detalhes_receita_info.dart';

class DetalhesReceita extends StatelessWidget {
  final Receita receita;

  const DetalhesReceita({required this.receita, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.titulo),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(
                  receita.imagemUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported);
                  },
                ),
              ),
              const SizedBox(height: 32),
              DetalhesReceitaInfo(text: "Descrição: ${receita.descricao}"),
              DetalhesReceitaInfo(
                  text: 'Tempo de preparo: ${receita.tempoPreparo}'),
              const Divider(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ingredientes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DetalhesReceitaInfo(text: receita.ingredientes),
              const Divider(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Modo de preparo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DetalhesReceitaInfo(text: receita.modoPreparo)
            ],
          ),
        ),
      ),
    );
  }
}
