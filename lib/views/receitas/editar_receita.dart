import 'package:flutter/material.dart';
import 'package:projeto_final/classes/receita.dart';
import 'package:projeto_final/model/receita_dao.dart';

class EditarReceita extends StatefulWidget {
  final Receita receita;
  const EditarReceita({super.key, required this.receita});

  @override
  State<EditarReceita> createState() => _EditarReceitaState();
}

class _EditarReceitaState extends State<EditarReceita> {
  late final TextEditingController _textTitulo;
  late final TextEditingController _textDescricao;
  late final TextEditingController _textIngredientes;
  late final TextEditingController _textTempoPreparo;
  late final TextEditingController _textModoPreparo;
  late final TextEditingController _textImagemUrl;

  @override
  void initState() {
    _textTitulo = TextEditingController(text: widget.receita.titulo);
    _textDescricao = TextEditingController(text: widget.receita.descricao);
    _textIngredientes =
        TextEditingController(text: widget.receita.ingredientes);
    _textTempoPreparo =
        TextEditingController(text: widget.receita.tempoPreparo);
    _textModoPreparo = TextEditingController(text: widget.receita.modoPreparo);
    _textImagemUrl = TextEditingController(text: widget.receita.imagemUrl);
    super.initState();
  }

  @override
  void dispose() {
    _textTitulo.dispose();
    _textDescricao.dispose();
    _textIngredientes.dispose();
    _textTempoPreparo.dispose();
    _textModoPreparo.dispose();
    _textImagemUrl.dispose();
    super.dispose();
  }

  Future<void> _salvarAlteracoes() async {
    var receitaAtualizada = Receita(
      id: widget.receita.id,
      titulo: _textTitulo.text,
      descricao: _textDescricao.text,
      ingredientes: _textIngredientes.text,
      tempoPreparo: _textTempoPreparo.text,
      modoPreparo: _textModoPreparo.text,
      imagemUrl: _textImagemUrl.text,
    );

    await ReceitaDao.atualizar(receitaAtualizada);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Receita')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _textTitulo,
              decoration: const InputDecoration(
                labelText: 'Nome da receita',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textDescricao,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textIngredientes,
              decoration: const InputDecoration(
                labelText: 'Ingredientes',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textTempoPreparo,
              decoration: const InputDecoration(
                labelText: 'Tempo de preparo',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textModoPreparo,
              decoration: const InputDecoration(
                labelText: 'Modo de preparo',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textImagemUrl,
              decoration: const InputDecoration(
                labelText: 'URL da imagem',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _salvarAlteracoes,
                    child: const Text('Salvar Alterações'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
