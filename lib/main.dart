import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 61.39,
        date: DateTime.now())
  ];
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              //height: 100,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (val) {
                        titleInput = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (val) => amountInput = val,
                    ),
                    FlatButton(
                      onPressed: () {
                        print(titleInput);
                        print(amountInput);
                      },
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.purple)),
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
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            }).toList())
          ],
        ));
  }
}
