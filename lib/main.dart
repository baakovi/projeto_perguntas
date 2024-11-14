import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

// O estado 'State' agora controla a variável
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 8},
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Elefante', 'pontuacao': 9},
        {'texto': 'Leão', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 2},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Léo', 'pontuacao': 6},
        {'texto': 'Pedro', 'pontuacao': 10},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    // print(_pontuacaoTotal);
    // print(_perguntaSelecionada);
  }

  void _reiniciarFormulario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Linguagem declarativa
    // List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    // Linguagem imperativa
    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      // home: Text('Hello, world.'),

      home: Scaffold(
        appBar: AppBar(
          // title => Parâmetro nomeado que recebe um widget
          title: Text('Perguntas'),
        ),
        // body: Text('Hello, world.'),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarFormulario),
      ),
    );
  }
}

// Herda de StatefulWidget
class PerguntaApp extends StatefulWidget {
  //
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

  // void Function() funcaoQueRetornaUmaOutraFuncao() {
  // return () {
  // print('Pergunta respondida #02!');
  // };
  // }
}
