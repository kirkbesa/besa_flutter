import 'package:flutter/material.dart';
import 'package:besa_flutter/globals.dart';

class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  // Store the selected bill for payment
  Map<String, dynamic>? selectedBill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the current balance
              Text(
                'Current Balance: \₱${currentBalance.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              // Display the list of bills
              Expanded(
                child: ListView.builder(
                  itemCount: bills.length,
                  itemBuilder: (context, index) {
                    final bill = bills[index];
                    return ListTile(
                      title: Text(bill['name']),
                      subtitle: Text('Amount: \₱${bill['amount']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Set the selected bill and show confirmation modal
                          setState(() {
                            selectedBill = bill;
                          });
                          _showConfirmationDialog(context, bill);
                        },
                        child: const Text('Pay'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Display the history of paid bills
              const Text(
                'Paid Bills History:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: paidBills.length,
                  itemBuilder: (context, index) {
                    final paidBill = paidBills[index];
                    return ListTile(
                      title: Text(paidBill['name']),
                      subtitle: Text('Paid: \₱${paidBill['amount']}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to show confirmation dialog
  void _showConfirmationDialog(BuildContext context, Map<String, dynamic> bill) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Text(
              'Are you sure you want to pay \₱${bill['amount']} for ${bill['name']}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Check if there's enough balance
                if (currentBalance >= bill['amount']) {
                  // Deduct the amount from current balance
                  setState(() {
                    currentBalance -= bill['amount'];
                    bills.remove(bill); // Remove paid bill from the list
                    paidBills.add(bill); // Add to the paid bills history
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  _showMessage(context, 'Payment Successful');
                } else {
                  Navigator.of(context).pop(); // Close the dialog
                  _showMessage(context, 'Insufficient Funds');
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Helper function to show a message to the user
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
