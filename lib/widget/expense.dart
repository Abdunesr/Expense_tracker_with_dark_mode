
import 'package:first_app/widget/chart/chart.dart';

import 'package:first_app/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/expen.dart';
import 'package:first_app/widget/expense_list/expense_list.dart';

class Expense extends StatefulWidget {
    Expense(this.day,{super.key});
  void Function() day;
  @override
  State<Expense> createState() {
    return _Expense();
  }
}


class _Expense extends State<Expense> {

  final List<Expen> _Registeredexpenses = [
    Expen(
        titel: 'flutter edu',
        amount: 22.33,
        date: DateTime.now(),
        catagory: Catagory.work),
    Expen(
        titel: 'cinema',
        amount: 15.66,
        date: DateTime.now(),
        catagory: Catagory.leisure),
  ];

  void _OpenAddExpenseOverlays() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(OnAddExpense: _addExpense),
    );
  }

  void _addExpense(Expen expense) {
    setState(() {
      _Registeredexpenses.add(expense);
    });
  }

  void _removeExpense(Expen expense) {
    final expenseindex = _Registeredexpenses.indexOf(expense);
    setState(() {
      _Registeredexpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _Registeredexpenses.insert(expenseindex, expense);
              });
            }),
      ),
    );
  }
 
  


  @override
  Widget build(context) {
   
    Widget mainContent = const Center(
      child: Text("There is no Expense   please try to add  Expenses"),
    );

    if (_Registeredexpenses.isNotEmpty) {
      mainContent = ExpenseList(_Registeredexpenses, _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Row(
          children: [
            IconButton(
              onPressed: widget.day,
              
              icon: const Icon(Icons.dark_mode),
            ),
          const   SizedBox(width: 56,),
            const Text("ABDELAH Expense Tracker "),
            
          ],
          
        ),
        
        actions: [
          IconButton(
            onPressed: _OpenAddExpenseOverlays,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        
        children: [
         Chart(expenses: _Registeredexpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
