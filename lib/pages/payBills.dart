// lib/pages/payBills.dart

import 'package:flutter/material.dart';

class PayBillsPage extends StatelessWidget {
  const PayBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: const Center(child: Text('Hello from Pay Bills')),
    );
  }
}
