import 'package:expense_tracker/data/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDismissed});

  final void Function(Expense expense) onDismissed;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (dismissDirection) {
          onDismissed(expenses[index]);
        },
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: Theme.of(context).cardTheme.margin
            // EdgeInsets.symmetric(
            //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            // ),
            ),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
    //Column can also be used to create a vertical list of items, but columns renders all the items in the list at the time of render which can cause perfomance issues. ListView.builder
    //creates a scrollable list of items which is only rendered when the item is visible on the screen
  }
}
