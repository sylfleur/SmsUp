import 'package:flutter/material.dart';
import 'package:smsup_app/screens/auth/login_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  "Créer un compte",
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
                            //TODO: Création de compte avec Email et password,
                          },
                          child: const Text(
                            'Créer',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(' Vous avez un compte? '),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                  child: const Text('Se connecter'),
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
