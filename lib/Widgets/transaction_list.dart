import "package:flutter/material.dart";
import "../Models/transaction.dart";
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(
    this.transactions,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.length == 0
            ? Column(children: <Widget>[
                Text("No Transactions Found Yet!"),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset("assets/images/waiting.png",
                        fit: BoxFit.contain))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Text(
                              "₹ ${transactions[index].amount.toString()}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ))),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.all(4),
                              child: Text(transactions[index].title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          Container(
                              child: Text(
                            DateFormat.yMMMMEEEEd()
                                .format(transactions[index].date),
                            // curr.date.toString(),
                            style: TextStyle(fontSize: 12),
                          ))
                        ])
                  ]));
                },
                itemCount: transactions.length));
  }
}
