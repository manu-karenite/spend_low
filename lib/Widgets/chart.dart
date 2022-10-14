import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "./chart_bar.dart";

class Chart extends StatelessWidget {
  final transactions;

  Chart(this.transactions, {super.key});
  var totalSum = 0.0;
  List get mapMyTrasactions {
    var mapp = {
      "Sun": 0.0,
      "Mon": 0.0,
      "Tue": 0.0,
      "Wed": 0.0,
      "Thu": 0.0,
      "Fri": 0.0,
      "Sat": 0.0
    };
    for (var i = 0; i < transactions.length; i++) {
      var curr_date = DateFormat.E().format(transactions[i].date);
      // print(curr_date + transactions[i].amount.toString());
      print("${transactions[i].amount} ${transactions[i].title}");
      totalSum = (totalSum + transactions[i].amount);
      print(totalSum);

      mapp[curr_date] = (mapp[curr_date]! + transactions[i]?.amount);
    }
    var l = [];
    mapp.forEach((key, value) {
      l.add({"day": key, "amount": value});
    });
    return l;
  }

  @override
  Widget build(BuildContext context) {
    //print(mapMyTrasactions);
    //print(totalSum);
    return Container(
        width: 400,
        child: Card(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: mapMyTrasactions.map((curr) {
                      return transactions.length == 0
                          ? ChartBar(
                              0.0, 0.0 as double, curr['day'].substring(0, 1))
                          : Flexible(
                              fit: FlexFit.tight,
                              child: ChartBar(
                                  curr['amount'],
                                  ((curr['amount'] / totalSum)) as double,
                                  curr['day'].substring(0, 1)));
                    }).toList()))));
  }
}
