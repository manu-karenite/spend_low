import "package:flutter/material.dart";

class ChartBar extends StatelessWidget {
  final currentAmount;
  final currentPercentage;
  final dayOfWeek;
  const ChartBar(this.currentAmount, this.currentPercentage, this.dayOfWeek,
      {super.key});

  @override
  Widget build(BuildContext context) {
    //print("${currentAmount} : ${currentPercentage} : ${dayOfWeek}");
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            FittedBox(child: Text(currentAmount.toString())),
            Container(
                height: 60,
                width: 10,
                child: Stack(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Color.fromARGB(255, 205, 205, 136),
                          borderRadius: BorderRadius.circular(2))),
                  FractionallySizedBox(
                      heightFactor: currentPercentage,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor)))
                ])),
            Text(dayOfWeek)
          ],
        ));
  }
}
