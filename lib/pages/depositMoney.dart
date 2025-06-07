import 'package:flutter/material.dart';
import 'package:besa_flutter/globals.dart';
class DepositMoneyPage extends StatefulWidget {
  const DepositMoneyPage({super.key});

  @override
  _DepositMoneyPageState createState() => _DepositMoneyPageState();
}

class _DepositMoneyPageState extends State<DepositMoneyPage> {
  // TextEditingController to manage input from the user
  TextEditingController depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Money'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display current balance after deposit
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: 
                Text(
                  'Current Balance: \₱${currentBalance.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              
              // Input field to receive deposit amount
              TextField(
                controller: depositController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Deposit Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Get the input value
                  String input = depositController.text;

                  // Check if input is a valid number and not empty
                  if (input.isEmpty) {
                    _showMessage(context, 'Please enter an amount');
                  } else {
                    double? depositAmount = double.tryParse(input);

                    if (depositAmount == null || depositAmount <= 0) {
                      _showMessage(context, 'Please enter a valid positive number');
                    } else {
                      // Add the deposit amount to currentBalance
                      setState(() {
                        currentBalance += depositAmount;
                      });

                      _showMessage(context, 'Deposited \₱${depositAmount.toStringAsFixed(2)}');
                    }
                  }
                },
                child: const Text('Deposit'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to show a message to the user
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
