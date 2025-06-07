import 'package:besa_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:besa_flutter/globals.dart';

class CheckBalancePage extends StatelessWidget {
  const CheckBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Balance'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0), 
              child: 
                Text(
                  'Current Balance: \₱${currentBalance.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.displayMedium,
              
                ),
            ),
            ElevatedButton(
              child: const Text('Go back'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
