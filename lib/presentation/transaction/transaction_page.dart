import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense/expense.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/utils/bottom_sheet_helpers.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/income/income_page.dart';
import 'package:cash_manager/presentation/transaction/widgets/custom_fab.dart';
import 'package:cash_manager/presentation/transaction/widgets/income_expense_chart.dart';
import 'package:cash_manager/presentation/transaction/widgets/top_bar.dart';
import 'package:cash_manager/presentation/transaction/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<Tab> tabs = _buildMonthTabs();

  @override
  void initState() {
    _tabController = TabController(
        vsync: this, length: 12, initialIndex: (DateTime.now().month - 1));
    super.initState();
  }

  List<Tab> _buildMonthTabs() {
    return months.map((month) => Tab(text: month)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        floatingActionButton: const CustomFAB(),
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: const Color(0xff0039a5),
                          child: const Padding(
                              padding: EdgeInsets.all(12.0), child: TopBar()),
                        )),
                    Positioned(
                        top: constraints.maxHeight - 100,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IncomeExpenseChart(),
                        )),
                  ],
                );
              }),
            ),
            SizedBox(
                height: 50,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TabBar(
                        indicatorColor: const Color(0xff86c1d2),
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.grey),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3.0,
                        onTap: (index) {
                          //Change month
                          context
                              .read<TransactionFilterCubit>()
                              .monthIndexChanged(index + 1,
                                  context.read<TransactionWatcherCubit>());
                        },
                        isScrollable: true,
                        controller: _tabController,
                        tabs: tabs))),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xfff2f7fa),
                child: BlocBuilder<TransactionWatcherCubit,
                    TransactionWatcherState>(
                  builder: (context, state) {
                    return state.map(
                        initial: (_) => const SizedBox(),
                        loadInProgress: (_) => const CustomProgressIndicator(),
                        loadSuccess: (successState) {
                          context
                              .read<TransactionFilterCubit>()
                              .updateTransactionList(successState.transactionData);
                          return BlocBuilder<TransactionFilterCubit,
                              TransactionFilterState>(
                            builder: (context, state) {
                              final transactions = state.transactions;
                              if (transactions.isNotEmpty) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: transactions.length,
                                    itemBuilder: (context, index) {
                                      final transaction = transactions[index];
                                      return transaction.fold((expense) {
                                        final isPreviousSameDay = (index != 0 &&
                                            expense.date.day ==
                                                transactions[index - 1].fold(
                                                        (expense) =>
                                                    expense.date.day,
                                                        (income) =>
                                                    income.date.day));
                                        final isNextSameDay = (index !=
                                                transactions.length - 1 &&
                                            expense.date.day ==
                                                transactions[index + 1].fold(
                                                    (expense) =>
                                                        expense.date.day,
                                                    (income) =>
                                                        income.date.day));
                                        return TransactionCard(
                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,
                                          onClicked: () {
                                            showCustomModalBottomSheet(
                                                context,
                                                ExpensePage(
                                                  expense: expense,
                                                ));
                                          },
                                          transaction: Transaction.fromExpense(expense),
                                        );
                                      }, (income) {
                                        final isPreviousSameDay = (index != 0 &&
                                            income.date.day ==
                                                transactions[index - 1].fold(
                                                    (expense) =>
                                                        expense.date.day,
                                                    (income) =>
                                                        income.date.day));
                                        final isNextSameDay = (index !=
                                                transactions.length - 1 &&
                                            income.date.day ==
                                                transactions[index + 1].fold(
                                                    (expense) =>
                                                        expense.date.day,
                                                    (income) =>
                                                        income.date.day));
                                        return TransactionCard(

                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,

                                          onClicked: () {
                                            showCustomModalBottomSheet(
                                                context,
                                                IncomePage(
                                                  income: income,
                                                ));
                                          },
                                          transaction: Transaction.fromIncome(income),

                                        );
                                      });
                                    });
                              } else {
                                return Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "There are no transactions for the selected period.",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ));
                              }
                            },
                          );
                        },
                        loadFailure: (_) => const CriticalFailureCard());
                  },
                ),
              ),
            )
          ],
        ));
  }
}
