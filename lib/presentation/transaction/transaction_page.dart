import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart';
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/income/income_page.dart';
import 'package:cash_manager/presentation/transaction/widgets/income_expense_chart.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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

  Widget _getFAB() {
    return SpeedDial(
      icon: Icons.add,
      iconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xff00b6e4),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.money_off, color: Color(0xff0039a5)),
          backgroundColor: Colors.white,
          onTap: () {
            showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                builder: (BuildContext context) => ExpensePage());
          },
          label: 'Expense',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16.0),
          // labelBackgroundColor: Color(0xFF801E48)
        ),
        // FAB 2
        SpeedDialChild(
          child: Icon(Icons.attach_money, color: Color(0xff0039a5)),
          backgroundColor: Colors.white,
          onTap: () {
            showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                builder: (BuildContext context) => IncomePage());
          },
          label: 'Income ',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        floatingActionButton: _getFAB(),
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
                        color: Color(0xff0039a5),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hi, Ilgiz",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Good morning",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Color(0xff00b5e6),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('total amount'.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey)),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('\$'.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                          Text(
                                            '2,400',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "View detail",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
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
                        indicatorColor: Color(0xff86c1d2),
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(color: Colors.grey),
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
                        initial: (_) => SizedBox(),
                        loadInProgress: (_) => CustomProgressIndicator(),
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
                                                    (income) => income.date.day));
                                        final isNextSameDay = (index !=
                                                transactions.length - 1 &&
                                            expense.date.day ==
                                                transactions[index + 1].fold(
                                                    (expense) =>
                                                        expense.date.day,
                                                        (income) => income.date.day));
                                        return TransactionCard(
                                          weekDay:
                                              weekDays[expense.date.weekday - 1]
                                                  .toUpperCase(),
                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,
                                          transactions: transactions,
                                          category: category,
                                          onClicked: () {
                                            showModalBottomSheet(
                                                context: context,
                                                isDismissible: false,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    20))),
                                                isScrollControlled: true,
                                                builder:
                                                    (BuildContext context) =>
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
                                      }, (income){
                                        final category = ExpenseCategory("Income", Icons.attach_money, Colors.yellow);
                                        final isPreviousSameDay = (index != 0 &&
                                            income.date.day ==
                                                transactions[index - 1].fold(
                                                        (expense) =>
                                                    expense.date.day,
                                                        (income) => income.date.day));
                                        final isNextSameDay = (index !=
                                            transactions.length - 1 &&
                                            income.date.day ==
                                                transactions[index + 1].fold(
                                                        (expense) =>
                                                    expense.date.day,
                                                        (income) => income.date.day));
                                        return TransactionCard(
                                          weekDay:
                                          weekDays[income.date.weekday - 1]
                                              .toUpperCase(),
                                          isPreviousSameDay: isPreviousSameDay,
                                          isNextSameDay: isNextSameDay,
                                          transactions: transactions,
                                          category: category,
                                          onClicked: () {
                                            // showModalBottomSheet(
                                            //     context: context,
                                            //     isDismissible: false,
                                            //     shape: RoundedRectangleBorder(
                                            //         borderRadius:
                                            //         BorderRadius.vertical(
                                            //             top:
                                            //             Radius.circular(
                                            //                 20))),
                                            //     isScrollControlled: true,
                                            //     builder:
                                            //         (BuildContext context) =>
                                            //         ExpensePage(
                                            //           expense: expense,
                                            //         ));
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
                                    margin: EdgeInsets.only(top: 20),
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
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(12),
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
                                category.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                transactionName,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(amountStr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
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
