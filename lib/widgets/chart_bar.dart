import 'package:app2/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChartBar extends StatelessWidget {
  
    final String label;
    final double  amountSpend;
    final double  percentSpent;

  ChartBar(this.label, this.amountSpend, this.percentSpent);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 20,
            child: FittedBox(
              child: Text('N ${amountSpend.toStringAsFixed(0)}', 
              style: TextStyle(
              fontFamily: 'QuickSans',
              fontWeight: FontWeight.bold
              ),),
                        ),
          ),
          SizedBox(height: 3,),
          Container(
            height: 70,
            width: 10,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:  Border.all(
                      color: Color.fromARGB(180, 69, 15, 79),
                       width: 1,
                    ),
                    // color: accentHexColor,
                                 gradient: LinearGradient(
                            colors:[ primaryHexChart,secondaryHexChart],
                            begin:Alignment.bottomLeft,
                            end:Alignment.topRight,
                            stops:  [0.4, 0.7],
                            tileMode: TileMode.repeated,
                    ),
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ), 
                ),
                FractionallySizedBox(
                  heightFactor: percentSpent, 
                  child: Container(
                    decoration: 
                    BoxDecoration(
                    //      gradient: LinearGradient(
                    //         colors:[ primaryHexChart,secondaryHexChart],
                    //         begin:Alignment.bottomLeft,
                    //         end:Alignment.topRight,
                    //         stops:  [0.4, 0.7],
                    //         tileMode: TileMode.repeated,
                    // ),
                                        color: accentHexColor,

                    borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  ),
                // Text(label)
              ],            
            ),
          ),
          SizedBox(height: 3,),
          Text(label)

        ],
      ),


    );
  }
}