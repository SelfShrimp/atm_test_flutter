import 'package:atm_test/atm_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MaterialApp(home:AtmScreen())
  );
}

class AtmScreen extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();

  AtmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM'),
        backgroundColor: Colors.purple,
      ),
      body: BlocProvider(
        create: (context) => AtmBloc(),
        child: BlocBuilder<AtmBloc, AtmState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Введите сумму',
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '1 234.00 руб',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      double amount = double.tryParse(amountController.text) ?? 0;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Выдать сумму', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 16),
                  if (state is AtmErrorState) ...[
                    Text(
                      state.error,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ] else if (state is AtmSuccessState) ...[
                    const Text(
                      'Банкомат выдал следующие купюры:',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    for (var note in state.issuedNotes)
                      Text(
                        note,
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                  ],
                  const SizedBox(height: 16),
                  const Text(
                    'Баланс банкомата:',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const Text(
                    '50 X 100 рублей\n100 X 200 рублей\n100 X 2000 рублей\n5 X 500 рублей\n10 X 1000 рублей\n10 X 5000 рублей',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}