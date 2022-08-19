import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:app2/constant/constants.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  Function delete;
  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  child: Text('You dont have transaction yet'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Image.asset('assets/BOOTSTRAP.png'),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                  ),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: ListTile(
                      leading: Container(
                        child:
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 199, 184, 184),
                            child: Icon(Icons.car_crash_sharp),
                            // child: Padding(
                            //   padding: EdgeInsets.all(6),
                            //   child: FittedBox(
                            //     child: Text('N${transactions[index].amount}'
                            //     ),
                            //   ),
                            // ),
                          ),
                   
                      ),
                      title: Row(
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(color: mainHexColor),
                          ),
                          SizedBox(width: 10),
                         Text('N${transactions[index].amount}',                             
                         style: TextStyle(color: mainHexColor),
                          ),

                        ],
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: 
                      
                      
                      IconButton(
                        onPressed: ()=>delete(transactions[index].id),
                        icon: Icon(
                          Icons.delete_forever,
                          color: RenderErrorBox.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
