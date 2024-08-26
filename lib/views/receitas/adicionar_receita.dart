import 'package:flutter/material.dart';
import 'package:projeto_final/classes/receita.dart';
import 'package:projeto_final/model/receita_dao.dart';

class AdicionarReceita extends StatefulWidget {
  const AdicionarReceita({super.key});

  @override
  State<AdicionarReceita> createState() => _AdicionarReceitaState();
}

class _AdicionarReceitaState extends State<AdicionarReceita> {
  late final TextEditingController _textTitulo;
  late final TextEditingController _textDescricao;
  late final TextEditingController _textIngredientes;
  late final TextEditingController _textTempoPreparo;
  late final TextEditingController _textModoPreparo;
  late final TextEditingController _textImagemUrl;

  @override
  void initState() {
    _textTitulo = TextEditingController();
    _textDescricao = TextEditingController();
    _textIngredientes = TextEditingController();
    _textTempoPreparo = TextEditingController();
    _textModoPreparo = TextEditingController();
    _textImagemUrl = TextEditingController();
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

  Future<void> _salvarReceita() async {
    var receita = Receita(
      titulo: _textTitulo.text,
      descricao: _textDescricao.text,
      ingredientes: _textIngredientes.text,
      tempoPreparo: _textTempoPreparo.text,
      modoPreparo: _textModoPreparo.text,
      imagemUrl: _textImagemUrl.text,
    );

    await ReceitaDao.inserir(receita);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Receita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _textTitulo,
              decoration: const InputDecoration(
                labelText: 'Título',
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
                labelText: 'Tempo de Preparo',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textModoPreparo,
              decoration: const InputDecoration(
                labelText: 'Modo de Preparo',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _textImagemUrl,
              decoration: const InputDecoration(
                labelText: 'URL da Imagem',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _salvarReceita,
                    child: const Text('Salvar Receita'),
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
