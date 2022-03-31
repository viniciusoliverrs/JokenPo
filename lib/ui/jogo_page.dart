import 'dart:math';

import 'package:flutter/material.dart';

class JogoPage extends StatefulWidget {
  const JogoPage({Key? key}) : super(key: key);

  @override
  State<JogoPage> createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  ImageProvider _imagemApp = const AssetImage("images/padrao.png");
  String _message = "Escolha uma opção abaixo";
  _opcaoSelecionada(String escolhaUsuario) {
    List<String> opcoes = ["pedra", "papel", "tesoura"];
    int numero = Random().nextInt(opcoes.length);
    String escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _message = "Parabéns!!! Você ganhou :)";
      });
    } else if (((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra"))) {
      setState(() {
        _message = "Você perdeu :(";
      });
    } else {
      setState(() {
        _message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
