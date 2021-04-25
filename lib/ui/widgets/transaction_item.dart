import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks/models/transactions.dart';


class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transactions transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.cyan,
      Colors.purpleAccent
    ];
    bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text(
                '\$ ${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}
