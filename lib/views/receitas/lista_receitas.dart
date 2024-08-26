import 'package:flutter/material.dart';
import 'package:projeto_final/classes/receita.dart';
import 'package:projeto_final/model/receita_dao.dart';
import 'package:projeto_final/views/receitas/adicionar_receita.dart';
import 'package:projeto_final/views/receitas/detalhes_receita.dart';
import 'package:projeto_final/views/receitas/editar_receita.dart';
import 'package:projeto_final/widgets/barra_pesquisa.dart';
import 'package:projeto_final/widgets/receita_tile.dart';

class ListaReceitas extends StatefulWidget {
  const ListaReceitas({super.key});

  @override
  State<ListaReceitas> createState() => _ListaReceitasState();
}

class _ListaReceitasState extends State<ListaReceitas> {
  Future<void> _deletarReceita(Receita receita) async {
    await ReceitaDao.deletar(receita);
    setState(() {});
  }

  Future<void> _editarReceita(Receita receita) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarReceita(receita: receita),
      ),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Receitas'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const BarraPesquisa(),
          FutureBuilder<List<Receita>>(
            future: ReceitaDao.carregarReceitas(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasError) {
                List<Receita> receitas = snapshot.data!;
                if (receitas.isEmpty) {
                  return const Center(
                    child: Text('Nenhuma receita cadastrada'),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: receitas.length,
                      itemBuilder: (context, index) => ReceitaTile(
                        receita: receitas[index],
                        delete: () => _deletarReceita(receitas[index]),
                        edit: () => _editarReceita(receitas[index]),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetalhesReceita(receita: receitas[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
              return const Center(child: Text('Houve um erro'));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdicionarReceita()),
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
