import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.isPreviousSameDay,
    required this.transactions,
    required this.category,
    required this.onClicked,
    required this.isNextSameDay,
    required this.transactionName,
    required this.amountStr,
    required this.weekDay,
    required this.day,
  });

  final bool isPreviousSameDay;
  final bool isNextSameDay;
  final String weekDay;
  final String day;
  final String transactionName;
  final String amountStr;
  final List<Either<Expense, Income>> transactions;
  final ExpenseCategory category;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            Container(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: isPreviousSameDay
                    ? Column(
                  children: List.generate(
                      150 ~/ 10,
                          (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.grey,
                          width: 2,
                        ),
                      )),
                )
                    : Column(
                  mainAxisAlignment: isNextSameDay
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDay,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      day,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xffb2e2ed),
                      radius: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 8, left: 8, top: isPreviousSameDay ? 2 : 8),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.all(12),
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: Center(
                              child: Icon(
                                category.iconData,
                                color: Colors.white,
                                size: 18,
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: category.color,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                transactionName,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(amountStr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}