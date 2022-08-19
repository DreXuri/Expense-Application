import 'package:app2/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function userInput;
  InputTransaction(
    this.userInput,
  );

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  // const InputTransaction({Key? key}) : super(key: key);
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  //////////function to add new field traction//

  void _submitHandler() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterTitle = _titleController.text;
    final enterAmount = double.parse(_amountController.text);

    if (enterAmount <= 0 || enterTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.userInput(enterTitle, enterAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _dateSelectorHandler() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((valuePicked) {
      if (valuePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = valuePicked;
      });
    });
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: accentHexColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gapPadding: 20,
                    ),
                    labelText: 'Title',
                    hintText: 'Enter Title'),
                controller: _titleController,
                onChanged: (_) => _submitHandler(),
                cursorColor: Colors.purple,
                style:
                    TextStyle(color: Colors.pink, fontStyle: FontStyle.italic),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide.none,
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(30)),
                    //   gapPadding: 20,
                    // ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      // .none,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gapPadding: 20,
                    ),
                    labelStyle: TextStyle(color: accentHexColor),
                    hintText: 'Enter Amount',
                    labelText: 'Amount'),
                controller: _amountController,
                onSubmitted: (_) => _submitHandler(),
                // onChanged: (val) {
                //   // amountInput = val;
                //   // print(amountInput);
                //   print(_amountController);
                // },
                cursorColor: Colors.green,
                style:
                    TextStyle(color: Colors.pink, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _dateSelectorHandler,
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.red,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _selectedDate == null
                        ? 'You Have No Date Selected'
                        : '${DateFormat.yMd().format(_selectedDate)}',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: _submitHandler,
              child: Text(
                'Add Order',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // ElevatedButton(
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.red),
            //     elevation: MaterialStateProperty.all(5),
            //   ),
            //   onPressed: ()=>print('hell0'),
            //  child: Text(' Order')),
          ],
        ),
      ),
    );
  }
}
