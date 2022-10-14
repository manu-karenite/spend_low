import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleText;
  final amountText;
  NewTransaction(this.addNewTransaction, this.titleText, this.amountText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Card(
          child: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: titleText,
                decoration: InputDecoration(labelText: "Title"))),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
                keyboardType: TextInputType.number,
                controller: amountText,
                onSubmitted: (_) => {
                      addNewTransaction(titleText.text,
                          double.parse(amountText.text), context)
                    },
                decoration: InputDecoration(labelText: "Amount"))),
        Container(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Add Transaction"),
                    onPressed: () => {
                      addNewTransaction(titleText.text,
                          double.parse(amountText.text), context)
                    },
                  )
                ])),
      ])),
    );
  }
}
