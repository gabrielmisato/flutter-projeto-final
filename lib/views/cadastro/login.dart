import 'package:flutter/material.dart';
import 'package:projeto_final/classes/usuario.dart';
import 'package:projeto_final/model/usuario_dao.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _senhaEscondida = true;
  late final TextEditingController _emailController;
  late final TextEditingController _senhaController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  void _verificaLogin() async {
    var email = _emailController.text;
    var senha = _senhaController.text;

    Usuario? usuario = await UsuarioDAO.verificaLogin(email, senha);

    if (usuario != null) {
      Navigator.pushNamed(context, '/principal');
    } else {
      _exibeMensagemErro(
          'Usuário não encontrado!', 'Email e/ou senha incorreto(s).');
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
                const SizedBox(height: 40),
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
                    label: const Text('Senha'),
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
                  onPressed: _verificaLogin,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Criar uma conta',
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
