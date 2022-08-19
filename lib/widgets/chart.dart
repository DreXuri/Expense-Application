import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  // final String chartlist;
  // Chart(this.chartlist);

  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, dynamic>> get listTransaction {
    return List.generate(7, (index) {
      // final today = DateTime.now();
      // final xDaysAgo = today.subtract(Duration(days: index));
      final xDaysAgo = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == xDaysAgo.day &&
            recentTransaction[i].date.month == xDaysAgo.month &&
            recentTransaction[i].date.year == xDaysAgo.year) {
          totalAmount += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(xDaysAgo).substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return listTransaction.fold(0.0 , (a, b) =>
       a + b['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(listTransaction);
    return 
    // Card(
        // elevation: 2,
        // margin: EdgeInsets.all(5),
        // child:
         Container(
          color: Colors.white,
          padding: 
          EdgeInsets.symmetric(
            vertical: 5, 
            horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listTransaction.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  e['day'] as String, 
                  e['amount'] as double, 
                  totalSpending== 0.0 
                  ? 0.0
                  :(e['amount']as double)/totalSpending,
                  ),
              );
            }).toList(),
          ),
        // ),
        );
  }
}
