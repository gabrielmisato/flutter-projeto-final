import 'package:flutter/material.dart';

class DetalhesReceitaInfo extends StatelessWidget {
  final String text;

  const DetalhesReceitaInfo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
