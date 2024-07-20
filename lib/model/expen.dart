import 'package:first_app/widget/expense.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//final formatter=DateFormat.yMd();

const uuid = Uuid();

enum Catagory { food, travel, leisure, work }

const CatagoryIcons = {
  Catagory.food: Icons.lunch_dining,
  Catagory.travel: Icons.flight_takeoff,
  Catagory.leisure: Icons.movie,
  Catagory.work: Icons.work,
};

class Expen {
  Expen({
    required this.titel,
    required this.amount,
    required this.date,
    required this.catagory,
  }) : id = uuid.v4();

  final String titel;
  final String id;
  final DateTime date;
  final double amount;
  final Catagory catagory;

  /* get formattedaDate{
    return date.formatter(date);

  } */
}

class ExpenseBucket {
  const ExpenseBucket({required this.catagory, required this.expens});
  ExpenseBucket.forCatagory(List<Expen> allExpense, this.catagory)
      : expens = allExpense.where((expe)=>expe.catagory==catagory).toList();

  final Catagory catagory;
  final List<Expen> expens;

  double get totalExpense {
    double sum = 0;

    for (final expe in expens) {
      sum += expe.amount;
    }
    return sum;
  } 
}
