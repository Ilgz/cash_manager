import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/routes/router.dart';
import 'package:cash_manager/presentation/core/utils/balance_formatter.dart';
import 'package:cash_manager/presentation/core/utils/bottom_sheet_helpers.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/income/income_page.dart';
import 'package:cash_manager/presentation/transaction/widgets/custom_fab.dart';
import 'package:cash_manager/presentation/transaction/widgets/income_expense_chart.dart';
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
  late final _tabController;
  late final List<Tab> tabs = months
      .map((e) => Tab(
            text: e,
          ))
      .toList();

  @override
  void initState() {
    _tabController = TabController(
        vsync: this, length: 12, initialIndex: (DateTime.now().month - 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        floatingActionButton: const CustomFAB(),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: const Color(0xff0039a5),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Hi, Ilgiz",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        "Good morning",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                      backgroundColor: Color(0xff00b5e6),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('total amount'.toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey)),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('\$'.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                          BlocBuilder<TransactionWatcherCubit,
                                              TransactionWatcherState>(
                                            builder: (context, state) {
                                              return Text(
                                                state.maybeMap(
                                                  loadSuccess: (state) {
                                                    double balance = 0;
                                                    for (var transaction
                                                        in state
                                                            .transactionData) {
                                                      transaction.fold(
                                                          (expense) =>
                                                              balance -= expense
                                                                  .amount
                                                                  .getOrCrash(),
                                                          (income) => balance +=
                                                              income.amount
                                                                  .getOrCrash());
                                                    }
                                                    return formatBalance(
                                                        balance);
                                                  },
                                                  orElse: () => '0',
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      goToDetailPage(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Text(
                                        "View detail",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      top: 150,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IncomeExpenseChart(),
                      )),
                ],
              ),
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
                          context
                              .read<TransactionFilterCubit>()
                              .monthIndexChanged(
                                  index,
                                  context
                                      .read<TransactionWatcherCubit>()
                                      .state
                                      .maybeMap(
                                          loadSuccess: (state) =>
                                              state.transactionData,
                                          orElse: () => []));
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
                              .updateTransactions(successState.transactionData);
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
                                        final category = Expense
                                            .categories[expense.category];
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
                                          weekDay:
                                              weekDays[expense.date.weekday - 1]
                                                  .toUpperCase(),
                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,
                                          transactions: transactions,
                                          category: category,
                                          onClicked: () {
                                            showCustomModalBottomSheet(
                                                context,
                                                ExpensePage(
                                                  expense: expense,
                                                ));
                                          },
                                          transactionName:
                                              expense.expenseName.getOrCrash(),
                                          amountStr:
                                              "-\$${expense.amount.getOrCrash()}",
                                          day: expense.date.day.toString(),
                                        );
                                      }, (income) {
                                        final category = ExpenseCategory(
                                            "Income",
                                            Icons.attach_money,
                                            Colors.yellow);
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
                                          weekDay:
                                              weekDays[income.date.weekday - 1]
                                                  .toUpperCase(),
                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,
                                          transactions: transactions,
                                          category: category,
                                          onClicked: () {
                                            showCustomModalBottomSheet(
                                                context,
                                                IncomePage(
                                                  income: income,
                                                ));
                                          },
                                          transactionName:
                                              income.incomeName.getOrCrash(),
                                          amountStr:
                                              "+\$${income.amount.getOrCrash()}",
                                          day: income.date.day.toString(),
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
