// lib/pages/checkBalance.dart

import 'package:flutter/material.dart';

class CheckBalancePage extends StatelessWidget {
  const CheckBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Check Balance'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      
      body: const Center(child: Text('Hello from Check Balance')),
    );
  }
}
