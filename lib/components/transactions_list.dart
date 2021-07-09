import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nenhuma transação cadastrada",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.5,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover)),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return TransactionItem(
                  tr: tr,
                  onRemove: onRemove,
                );
              },
            ),
    );
  }
}
