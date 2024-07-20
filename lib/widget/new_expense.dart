import 'dart:ffi';

import 'package:first_app/model/expen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.OnAddExpense });
  final void  Function(Expen expense) OnAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {

 
  final _titelController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedCatagory =  Catagory.work ;
  DateTime? selectedDate;
  int? temp;



  @override
  void dispose() {
    _titelController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }



    void _submitExpenseData(){

      final enteredData= double.tryParse(_amountController.text);
      final amountIsInvalid= enteredData==null ||enteredData<=0;

        if(_titelController.text.trim().isEmpty  || amountIsInvalid || selectedDate==null){
          showDialog(context: context, builder: (ctx)=>AlertDialog(
            title:const Text("Invalid Input"),
            content: const  Text("please make sure that you entered correct amount date titel and catagory you selected"),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(ctx);
              }, child:const  Text("okay"))
            ],
          ),
          );
         return;
        }
        widget.OnAddExpense(Expen(titel: _titelController.text, amount: enteredData, date: selectedDate!, catagory: _selectedCatagory) );
         Navigator.pop(context);
        
    }





  /*var _enteredTitel = '';
   for storing users input the first option
  void _storetitelInput(String InputValue) {
    _enteredTitel = InputValue;
  }
 */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titelController,
            maxLength: 50,
            decoration: const InputDecoration(
                label: Text("TITEL",style: TextStyle(color: Colors.white),), hintText: 'please add the title here',hintStyle: TextStyle(color: Colors.white)),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$ ',
                      label: Text("Amount",style: TextStyle(color: Colors.white)),
                      hintText: 'please add the amount here'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'no date selected'
                          : (('$selectedDate.year')),style:const  TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                      style: IconButton.styleFrom(hoverColor: Colors.yellow),
                    )
                  ],
                ),
              ),
            ],
          ),
         const  SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCatagory,
                  items: Catagory.values
                      .map(
                        (catagory) => DropdownMenuItem(
                          value:catagory ,
                          child: Text(
                            catagory.name.toUpperCase(),style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if(value==null){
                      return;
                    }
                    setState(() {

                      _selectedCatagory=value;
                    });
                  }),
                  const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
