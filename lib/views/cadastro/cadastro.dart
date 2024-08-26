import 'package:flutter/material.dart';
import 'package:projeto_final/classes/usuario.dart';
import 'package:projeto_final/model/usuario_dao.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _senhaEscondida = true;
  late final TextEditingController _emailController;
  late final TextEditingController _senhaController;
  late final TextEditingController _confirmaSenhaController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    _confirmaSenhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _confirmaSenhaController.dispose();
    super.dispose();
  }

  void _alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  void _verificaCadastro() async {
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      _exibeMensagemErro(
          'Campo(s) vazio(s)!', 'Verifica os campos de e-mail e senha.');
    } else if (_senhaController.text != _confirmaSenhaController.text) {
      _exibeMensagemErro('Senhas diferentes!',
          'Verifique novamente se os campos de senhas são iguais.');
    } else {
      var usuarios = await UsuarioDAO.carregarUsuarios();

      bool emailExiste = usuarios.any((u) => u.email == _emailController.text);

      if (emailExiste) {
        _exibeMensagemErro('E-mail já está em uso!',
            'Por favor escolha um outro endereço de e-mail.');
      } else {
        var usuario = Usuario(
          email: _emailController.text,
          senha: _senhaController.text,
        );
        await UsuarioDAO.inserir(usuario);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('OK'),
              ),
            ],
            title: const Text('Usuário cadastrado com sucesso!'),
            content: const Text(
                'Ao clicar em OK você será redirecionado para a página de login.'),
          ),
        );
      }
    }
  }

  void _exibeMensagemErro(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tente novamente'),
          )
        ],
        title: Text(title),
        content: Text(content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: 160,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text('E-mail'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _senhaController,
                  obscureText: _senhaEscondida,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _alterarVisibilidade,
                      icon: Icon(_senhaEscondida
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    label: const Text('Crie uma senha'),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _confirmaSenhaController,
                  obscureText: _senhaEscondida,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _alterarVisibilidade,
                      icon: Icon(_senhaEscondida
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    label: const Text('Confirme sua senha'),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.75, 50),
                    backgroundColor: const Color.fromARGB(255, 63, 111, 236),
                  ),
                  onPressed: _verificaCadastro,
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 63, 111, 236),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
