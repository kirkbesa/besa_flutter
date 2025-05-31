// lib/pages/deposit.dart

import 'package:flutter/material.dart';

class DepositMoneyPage extends StatelessWidget {
  const DepositMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deposit Money'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: const Center(child: Text('Hello from Deposit Money')),
    );
  }
}
