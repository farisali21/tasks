import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onPressed;
  NewTransaction(this.onPressed);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  DateTime _dateTime;

  void addNewTransaction() {
    String enteredTitle = titleController.text;
    double enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _dateTime == null) {
      return;
    }
    widget.onPressed(
      enteredTitle,
      enteredAmount,
      _dateTime,
    );
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _dateTime = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => addNewTransaction,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => addNewTransaction,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _dateTime == null
                            ? 'No Date Choosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_dateTime)}',
                      ),
                    ),
                    Platform.isIOS ? CupertinoButton( onPressed: _showDatePicker,
                      child: Text(
                        'choose date!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),) :FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                      child: Text(
                        'choose date!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transactions'),
                onPressed: addNewTransaction,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
