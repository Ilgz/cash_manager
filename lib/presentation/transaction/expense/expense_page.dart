import 'package:cash_manager/application/expense/expense_form/expense_form_cubit.dart';
import 'package:cash_manager/application/expense/expense_watcher/expense_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/widgets/failure_snackbar.dart';
import 'package:cash_manager/presentation/transaction/widgets/transaction_amount.dart';
import 'package:cash_manager/presentation/transaction/widgets/transaction_name.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensePage extends StatelessWidget {
  ExpensePage({super.key, this.expense});
  final Expense? expense;
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(expense!=null){
      _nameController.text=expense!.expenseName.getOrCrash();
      _amountController.text=expense!.amount.getOrCrash().toString();
    }
    return BlocProvider(
      create: (context) => getIt<ExpenseFormCubit>()..initialize(expense),
  child: Builder(
    builder: (context) {
      return BlocListener<ExpenseFormCubit, ExpenseFormState>(
            listenWhen: (p,c)=>p.authFailureSuccessOption!=c.authFailureSuccessOption,
        listener: (context, state) {
          state.authFailureSuccessOption.fold( (){
          }, (either) =>either.fold((f) => FailureSnackBar(failure: f), (_) {
            context.read<ExpenseWatcherCubit>().getExpenses();
            Navigator.pop(context);}));
        },
        child: Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, size: 20),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          expense==null?"Add new expense":"Edit expense",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
                SizedBox(
                  height: 12,
                ),
                BlocBuilder<ExpenseFormCubit, ExpenseFormState>(
                  builder: (context, state) {
                    return TransactionName(
                      state: left(state),
                      controller: _nameController, onChanged: (value){
                      context.read<ExpenseFormCubit>().nameChanged(value);
                    },
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<ExpenseFormCubit, ExpenseFormState>(
                  builder: (context, state) {
                    return AmountWidget(
                      state: left(state),
                      controller: _amountController, onChanged: (String value) {
                      context.read<ExpenseFormCubit>().amountChanged(value);
                    },
                    );
                  },
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    templatePriceWidget(10,context),
                    templatePriceWidget(50,context),
                    templatePriceWidget(100,context),
                    templatePriceWidget(500,context),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "choose category".toUpperCase(),
                  style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                ),
                SizedBox(height: 4),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: BlocBuilder<ExpenseFormCubit, ExpenseFormState>(
        builder: (context, state) {
          return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Expense.categories.length,
                      itemBuilder: (context, index) {
                        final category = Expense.categories[index];
                        return GestureDetector(
                          onTap: (){
                            context.read<ExpenseFormCubit>().categoryChanged(index);
                          },
                          child: SizedBox(
                            width: 55,
                            height: 60,
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(12),
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Icon(
                                      category.iconData,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: category.color,
                                    )),
                                Visibility(visible:state.expense.category==index,child: Positioned(right:0,top:0,child: Container(width:20,height:20,padding:EdgeInsets.all(4),decoration:BoxDecoration(color:Color(0xff00b6e4),borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),child: FittedBox(fit:BoxFit.contain,child: Icon(Icons.done,color: Colors.white,)))))

                              ],
                            ),
                          ),
                        );
                      });
        },
),
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Visibility(
                      visible: expense!=null,
                      child: Expanded(child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                context.read<ExpenseFormCubit>().deleteExpense(expense!);
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              )))),
                    ),
                    Visibility(                  visible: expense!=null,
                        child: SizedBox(width: 10,)),
                    Expanded(
                      child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff00b6e4)),
                              onPressed: () {
                                if(expense==null){
                                  context.read<ExpenseFormCubit>().createExpense();
                                }else{
                                  context.read<ExpenseFormCubit>().updateExpense(expense!);
                                }
                              },
                              child: Text(
                                expense!=null?"Save":"Add",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
);
    }
  ),
);
  }

  Widget templatePriceWidget(int amount,BuildContext context) {
    return GestureDetector(
      onTap:(){
        context.read<ExpenseFormCubit>().amountChanged(amount.toString());
        _amountController.text=amount.toString();
      },
      child: BlocBuilder<ExpenseFormCubit, ExpenseFormState>(
  builder: (context, state) {
      return Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),

          decoration: BoxDecoration(
              color: Colors.grey[300],borderRadius: BorderRadius.circular(50)),
          child: Text(
            "\$ $amount".toUpperCase(),
            style: TextStyle(fontSize: 12, color: Colors.grey[900]),
          ));
  },
),
    );
  }
}






