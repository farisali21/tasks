import 'package:flutter/material.dart';

class Transactions {
  final String title;
  final String id;
  final double amount;
  final DateTime date;

  Transactions(
      {@required this.title,
      @required this.amount,
      @required this.date,
      @required this.id});
}
