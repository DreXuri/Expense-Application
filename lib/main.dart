import 'dart:html';
import 'package:app2/constant/constants.dart';
import '../widgets/chart.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:flutter/cupertino.dart';
import '../widgets/inputTransaction.dart';
import '../widgets/transactionList.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import './models/transaction.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Uber', amount: 137.07, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Taxify', amount: 407.53, date: DateTime.now()),
    Transaction(id: 't3', title: 'Gokada', amount: 607.6, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  // String txTitle;
  // double txAmount;
  void _pushNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((ele) => ele.id == id);
    });
  }

  void _startAddTransactionNew(BuildContext ctxt) {
    var ModalScollController;
    showModalBottomSheet(
      context: ctxt,
      builder: (_) {
        //   return InputTransaction(_pushNewTransaction);
        // },

        return GestureDetector(
          onTap: () {},
          child: InputTransaction(_pushNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Colors.red,
        //  primarySwatch: Colors.red,
        primarySwatch: Colors.purple,
        accentColor: accentHexColor,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'QuickSans',
            fontSize: 24,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          toolbarOpacity: 0.8,
          title: Text(
            'Dashboard',
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.crop_free_sharp,
            color: accentHexColor,
            size: 30,
          ),
          actions: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  child: Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // image: AssetImage('assets/leilani.jpg'),
                            image: AssetImage('assets/picture.jpeg'),
                          ),
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 5,
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 3)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            // height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: accentHexColor,
                  child: Chart(_recentTransactions),
                ),
                TransactionList(_userTransaction, _deleteTransaction),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 6,
          // backgroundColor: Colors.pink,
          hoverColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {
            print('new print');
            _startAddTransactionNew(context);
            // (context);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(iconSize: 24, items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: accentHexColor,
              ),
              label: 'Home',
              backgroundColor: accentHexColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Chart',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: accentHexColor),
        ]),
      ),
    );
  }
}
