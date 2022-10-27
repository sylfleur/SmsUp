import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Se connecter",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 18,
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            //TODO: Authentification avec Email et password,
                          },
                          child: const Text(
                            'Se connecter',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('Vous n\'aviez pas un compte?'),
                OutlinedButton(
                  onPressed: () {
                    //TODO: Aller à la page de création de compte,
                    Navigator.pop(context);
                  },
                  child: const Text('Créer'),
                ),
                const Text('Ou'),
                IconButton(
                  onPressed: () {
                    //TODO: Authentification avec Google
                  },
                  icon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
