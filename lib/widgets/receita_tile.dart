import 'package:flutter/material.dart';
import 'package:projeto_final/classes/receita.dart';

class ReceitaTile extends StatelessWidget {
  const ReceitaTile({
    super.key,
    required this.receita,
    required this.delete,
    required this.edit,
    required this.onTap,
  });

  final Receita receita;
  final VoidCallback delete;
  final VoidCallback edit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListTile(
        leading: SizedBox(
          width: 90,
          height: 90,
          child: Image.network(
            receita.imagemUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(receita.titulo),
        subtitle: Text(receita.descricao),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: edit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: delete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        onTap: onTap,
        tileColor: const Color.fromARGB(255, 227, 227, 227),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
