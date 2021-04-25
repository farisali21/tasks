import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/transactions.dart';

import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;
  final Function deleteTransaction;
  TransactionList(this.transaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions add yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transaction
                .map(
                  (transaction) => TransactionItem(
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteTransaction: deleteTransaction,
                  ),
                )
                .toList(),
          );
  }
}

// ListView(
// children: transaction
//     .map((transaction) => TransactionItem(
// transaction: transaction, deleteTransaction: deleteTransaction))
// .toList(),
// );
