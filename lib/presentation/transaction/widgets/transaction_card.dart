import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/presentation/core/utils/datetime_utils.dart';
import 'package:cash_manager/presentation/core/utils/transaction_display_utils.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.isPreviousSameDay,
    required this.onClicked,
    required this.isNextSameDay,
    required this.transaction
  });

  final bool isPreviousSameDay;
  final bool isNextSameDay;
  final Transaction transaction;
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
                            getWeekday(transaction.date),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            getDay(transaction.date),
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
                            transaction.category.iconData,
                            color: Colors.white,
                            size: 18,
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: transaction.category.color,
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
                                transaction.category.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                transaction.name.getOrCrash(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(getAmountWithTransactionSignifier(transaction),
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
