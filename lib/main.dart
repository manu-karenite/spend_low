import 'package:flutter/material.dart';

//importing custom packages
import "./Models/transaction.dart";
import "./Widgets/new_transaction.dart";
import "./Widgets/transaction_list.dart";
import "./Widgets/chart.dart";

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [];
  var titleText = TextEditingController();
  var amountText = TextEditingController();
  void addNewTransaction(String title, double amount, BuildContext context) {
    final ntx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      transactions.add(ntx);
    });
    titleText.text = "";
    amountText.text = "";
    Navigator.pop(context);
  }

  void showAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(addNewTransaction, titleText, amountText);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.amber,
                fontFamily: "Mukta"),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(title: Text("Spend Low"), actions: <Widget>[
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        showAddTransactionModal(context);
                      },
                      icon: const Icon(Icons.add),
                      tooltip: "Add New Transaction",
                    ),
                  )
                ]),
                body: Column(children: <Widget>[
                  Chart(transactions),
                  Expanded(
                      child: Container(
                          child: Column(children: <Widget>[
                    // NewTransaction(addNewTransaction, titleText, amountText),
                    TransactionList(transactions)
                  ]))),
                ]),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Builder(
                  builder: (context) => FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        showAddTransactionModal(context);
                      }),
                ))));
  }
}

void main() {
  runApp(MyApp());
}
