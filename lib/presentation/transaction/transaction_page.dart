import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/utils/bottom_sheet_helpers.dart';
import 'package:cash_manager/presentation/core/utils/transaction_utils.dart';
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
            SizedBox(
              height: 360,
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 184,
                        padding: EdgeInsets.all(12.0),
                        color: const Color(0xff0039a5),
                        child: TopBar(),
                      )),
                  const Positioned(
                      top: 160,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            SizedBox(height: 200, child: IncomeExpenseChart()),
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
                          // Change month
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
                          // Updates data for filtering when new raw data is fetched
                          context
                              .read<TransactionFilterCubit>()
                              .updateTransactionList(
                                  successState.transactionData);
                          return BlocBuilder<TransactionFilterCubit,
                              TransactionFilterState>(
                            builder: (context, state) {
                              final transactions = state.transactions;
                              if (transactions.isNotEmpty) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: transactions.length,
                                    itemBuilder: (context, index) {
                                      // Transforms expenses and incomes into a list of Transactions
                                      final transactions =
                                          convertEitherToTransactionList(
                                              state.transactions);
                                      final transaction = transactions[index];
                                      // Checks if previous transaction is on the same day
                                      final isPreviousSameDay =
                                          isSameDayAsPrevious(
                                              index, transactions);
                                      // Checks if next transaction is on the same day
                                      final isNextSameDay = isSameDayAsPrevious(
                                          index, transactions);
                                      return TransactionCard(
                                          isPreviousSameDay: isPreviousSameDay,
                                          onClicked: () {
                                            showCustomModalBottomSheet(
                                                context,
                                                state.transactions[index].fold(
                                                    (expense) => ExpensePage(
                                                        expense: expense),
                                                    (income) => IncomePage(
                                                          income: income,
                                                        )));
                                          },
                                          isNextSameDay: isNextSameDay,
                                          transaction: transaction);
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

  bool isSameDayAsPrevious(int index, List<Transaction> transactionList) {
    if (index == 0) {
      return false;
    }
    final previousTransaction = transactionList[index - 1];
    final currentTransaction = transactionList[index];
    return previousTransaction.date.day == currentTransaction.date.day;
  }

  bool isSameDayAsNext(int index, List<Transaction> transactionList) {
    if (index == transactionList.length - 1) {
      return false;
    } else {
      final nextTransaction = transactionList[index + 1];
      final currentTransaction = transactionList[index];
      return nextTransaction.date.day == currentTransaction.date.day;
    }
  }
}
