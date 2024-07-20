import 'package:flutter/material.dart';
import 'package:first_app/model/expen.dart';
import 'package:first_app/widget/expense_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.expenses, this.onDismissedData, {super.key});

  final List<Expen> expenses;
  final void Function(Expen expens) onDismissedData;

  @override
  Widget build(context) {
    return ListView.builder(
   
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error,),
        onDismissed: (direction) {
          onDismissedData(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
