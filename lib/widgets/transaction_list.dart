import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.purple)),
            child: Text(
              '\$${tx.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title.toString(),
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(tx.date),
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ));
    }).toList());
  }
}
