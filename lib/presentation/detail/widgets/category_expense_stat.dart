import 'package:cash_manager/domain/transaction/category.dart';
import 'package:flutter/material.dart';

class CategoryExpenseStat extends StatelessWidget {
  const CategoryExpenseStat({Key? key, required this.index, required this.length, required this.top4Categories}) : super(key: key);
  final int index;
  final int length;
  final Map<ExpenseCategory, int> top4Categories;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: length<index+1?SizedBox():SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
                padding: EdgeInsets.all(12),
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:                       top4Categories.keys.toList()[index].color,

                ),
                child: Center(
                    child: Icon(
                      top4Categories.keys.toList()[index].iconData,
                      color: Colors.white,
                      size: 18,
                    ))),
            SizedBox(
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
                    top4Categories.keys.toList()[index].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(                      top4Categories.values.toList()[index].toString(),

                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
