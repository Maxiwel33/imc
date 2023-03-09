import 'package:flutter/material.dart';
import 'package:maximc/setstates/imc_setstates.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setstate'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () => _goToPage(context, const ImcPage()),
            child: const Text('SetState'),
          )
        ]),
      ),
    );
  }
}
