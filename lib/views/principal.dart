import 'package:flutter/material.dart';
import 'package:projeto_final/views/api/pesquisa_receita.dart';
import 'package:projeto_final/views/receitas/lista_receitas.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _itemSelecionado = 0;

  final List<Widget> _subtelas = [
    const ListaReceitas(),
    const PesquisaReceita()
  ];

  void _mudaBottomNav(int idx) {
    if (idx == 2) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Sim'),
            ),
          ],
          title: const Text('Sair do aplicativo'),
          content: const Text('Tem certeza de que deseja sair?'),
        ),
      );
      return;
    }
    setState(() {
      _itemSelecionado = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _subtelas[_itemSelecionado],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Minhas receitas',
            icon: Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: 'Pesquisar receita',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Sair',
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        currentIndex: _itemSelecionado,
        onTap: _mudaBottomNav,
      ),
    );
  }
}
