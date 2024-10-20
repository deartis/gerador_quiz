import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  //final List<Map<String, dynamic>> _perguntas = [];
  final List<Map<String, dynamic>> _resposta = [];
  final _perguntaController = TextEditingController();
  final respostaController = TextEditingController();
  final produtoIndicadoController = TextEditingController();
  final idProdutoController = TextEditingController();
  final urlImagemController = TextEditingController();

  Map<String, dynamic> _dadosDaPergunta() {
    var dados = {
      'Resposta': respostaController.text,
      'Produto Indicado': produtoIndicadoController.text,
      'ID do produto': idProdutoController.text,
      'URL da Imagem': urlImagemController.text,
    };
    return dados;
  }

  void _openaddOptionModal() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Adicionar Opção"),
            content: SizedBox(
              width: 600,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: respostaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Opçao',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: produtoIndicadoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Produto Indicado',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: idProdutoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ID do produto',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: urlImagemController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'URL da Imagem',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resposta.add(_dadosDaPergunta());
                  });
                  respostaController.clear();
                  produtoIndicadoController.clear();
                  idProdutoController.clear();
                  urlImagemController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Salvar"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Quiz Jumpseller'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _perguntaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pergunta',
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: SizedBox(
                  width: 600,
                  child: ElevatedButton(
                    onPressed: () {
                      _openaddOptionModal();
                    },
                    child: const Text("Add Opção"),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: SizedBox(
                  height:
                      200, // Definir uma altura fixa ou usar Expanded para expandir
                  child: ListView.builder(
                    itemCount: _resposta.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_resposta[index]['Resposta']),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
