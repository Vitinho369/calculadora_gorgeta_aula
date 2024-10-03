import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialHome());
}

class MaterialHome extends StatelessWidget {
  const MaterialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldHome(),
    );
  }
}

class ScaffoldHome extends StatelessWidget {
  const ScaffoldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcula Gorgeta',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade50,
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late double _resultado;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _resultado = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); //
  }

  void calcula() {
    setState(() {
      _resultado = double.parse(_controller.value.text) * 1.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/jarra_dinheiro.png'),
              ),
              border: Border.all(
                width: 10,
                color: Colors.black,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (value) =>
                calcula(), // o valor é o que está dentro do input text
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Digite o valor da sua conta",
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade900,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.monetization_on_outlined)),
          ),
        ),
        // ElevatedButton(
        //   onPressed: () => calcula(),
        //   child: Text(
        //     "Calcular",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.grey.shade600,
        //     elevation: 5,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "R\$ ${_resultado.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
