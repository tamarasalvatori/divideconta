import 'package:flutter/material.dart';

class DivideConta extends StatefulWidget {
  @override
  _DivideContaState createState() => _DivideContaState();
}

class _DivideContaState extends State<DivideConta> {
  TextEditingController _valorTotal = TextEditingController();
  TextEditingController _porcentagem = TextEditingController();
  TextEditingController _pessoas = TextEditingController();

  var resposta = "Insira as informação para cálculo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Divide Conta")),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration:
                InputDecoration(labelText: "Valor total da conta em reais"),
            controller: _valorTotal,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Porcentagem do garçom"),
            controller: _porcentagem,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Número de pessoas a dividir a conta"),
            controller: _pessoas,
          ),
          ElevatedButton(
            onPressed: calcular,
            child: Text("Calcular"),
          ),
          Text(
            resposta,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  calcular() {
    setState(() {
      double valorTotal = double.parse(_valorTotal.text);
      double porcentagem = double.parse(_porcentagem.text);
      double pessoas = double.parse(_pessoas.text);

      double valorGarcon = (valorTotal) * (porcentagem) / 100;
      double valorTotalGeral = valorTotal + valorGarcon;
      double totalPessoa = valorTotalGeral / pessoas;

      resposta = "Valor a ser pago ao garçom: " +
          valorGarcon.toString() +
          "\nValor total da conta: " +
          valorTotalGeral.toString() +
          "\nValor a ser pago por pessoa: " +
          totalPessoa.toString();
    });
  }
}
