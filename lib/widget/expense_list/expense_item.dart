import 'package:first_app/model/expen.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expens, {super.key});

  final Expen expens;

  @override
  Widget build(context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(expens.titel,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\$${expens.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                 Row(
                  children: [
                    Icon(CatagoryIcons[expens.catagory],),
                    const SizedBox(width: 8,),
                    Text(expens.date.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
