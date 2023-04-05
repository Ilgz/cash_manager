import 'package:cash_manager/application/expense/expense_form/expense_form_cubit.dart';
import 'package:cash_manager/application/income/income_form/income_form_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/widgets/failure_snackbar.dart';
import 'package:cash_manager/presentation/transaction/widgets/transaction_amount.dart';
import 'package:cash_manager/presentation/transaction/widgets/transaction_name.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomePage extends StatelessWidget {
  IncomePage({super.key, this.income});
  final Income? income;
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(income!=null){
      _nameController.text=income!.incomeName.getOrCrash();
      _amountController.text=income!.amount.getOrCrash().toString();
    }
    return Padding(
        padding: MediaQuery.of(context).viewInsets,      child: BlocProvider(
        create: (context) => getIt<IncomeFormCubit>()..initialize(income),
        child: Builder(
            builder: (context) {
              return BlocListener<IncomeFormCubit, IncomeFormState>(
                listenWhen: (p,c)=>p.authFailureSuccessOption!=c.authFailureSuccessOption,
                listener: (context, state) {
                  state.authFailureSuccessOption.fold( (){
                  }, (either) =>either.fold((f) => FailureSnackBar(failure: f), (_) {
                    context.read<TransactionWatcherCubit>().getTransactionData();
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
                                income==null?"Add new income":"Edit income",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ]),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      BlocBuilder<IncomeFormCubit, IncomeFormState>(
                        builder: (context, state) {
                          return TransactionName(
                            state: right(state),
                            controller: _nameController, onChanged: (value){
                            context.read<IncomeFormCubit>().nameChanged(value);
                          },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<IncomeFormCubit, IncomeFormState>(
                        builder: (context, state) {
                          return AmountWidget(
                            state: right(state),
                            controller: _amountController, onChanged: (String value) {
                            context.read<IncomeFormCubit>().amountChanged(value);
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
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: income!=null,
                            child: Expanded(child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      context.read<IncomeFormCubit>().deleteIncome(income!);
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    )))),
                          ),
                          Visibility(                  visible: income!=null,
                              child: SizedBox(width: 10,)),
                          Expanded(
                            child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff00b6e4)),
                                    onPressed: () {
                                      if(income==null){
                                        context.read<IncomeFormCubit>().createIncome();
                                      }else{
                                        context.read<IncomeFormCubit>().updateIncome(income!);
                                      }
                                    },
                                    child: Text(
                                      income!=null?"Save":"Add",
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
      ),
    );
  }

  Widget templatePriceWidget(int amount,BuildContext context) {
    return GestureDetector(
      onTap:(){
        context.read<IncomeFormCubit>().amountChanged(amount.toString());
        _amountController.text=amount.toString();
      },
      child: BlocBuilder<IncomeFormCubit, IncomeFormState>(
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






