import 'package:cash_manager/application/%20expense/expense_filter/expense_filter_cubit.dart';
import 'package:cash_manager/application/%20expense/expense_watcher/expense_watcher_cubit.dart';
import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/transaction/expense/expense_page.dart';
import 'package:cash_manager/presentation/transaction/widgets/income_expense_chart.dart';
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
    _tabController = TabController(vsync: this, length: 12,initialIndex: (DateTime.now().month-1));
    super.initState();
  }
  Widget _getFAB() {
    return SpeedDial(
      icon:Icons.add,
     iconTheme: IconThemeData(size: 22),
     // animatedIcon: AnimatedIcons.menu_close,
     // animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xff00b6e4),
      visible: true,

      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.money_off),
            backgroundColor: Color(0xff0039a5),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20))),
                  isScrollControlled: true,
                  builder: (BuildContext context) =>
                      ExpensePage());
            },
            // label: 'Expense',
            // labelStyle: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     color: Colors.white,
            //     fontSize: 16.0),
            // labelBackgroundColor: Color(0xFF801E48)
        ),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.attach_money),
            backgroundColor: Color(0xff0039a5),
            onTap: () {
              // setState(() {
              //   _counter = 0;
              // });
            },
            // label: 'Income',
            // labelStyle: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     color: Colors.white,
            //     fontSize: 16.0),
            // labelBackgroundColor: Color(0xFF801E48)
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(20)),
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
                    labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3.0,

                    onTap: (index) {
                      context.read<ExpenseFilterCubit>().monthIndexChanged(index,context.read<ExpenseWatcherCubit>().state.maybeMap(loadSuccess:(state)=>state.expenses,orElse: ()=>[]));
                    },
                    isScrollable: true,
                    controller: _tabController,
                    tabs: tabs))),
        Expanded(
          child: Container(
            width: double.infinity,
            color: const Color(0xfff2f7fa),
            child: BlocBuilder<ExpenseWatcherCubit, ExpenseWatcherState>(
  builder: (context, state) {
    return state.map(initial: (_)=>SizedBox(), loadInProgress: (_)=>CustomProgressIndicator(), loadSuccess: (successState){
        context.read<ExpenseFilterCubit>().updateExpenses(successState.expenses);
        return BlocBuilder<ExpenseFilterCubit, ExpenseFilterState>(
  builder: (context, state) {
    final expenses=state.expenses;
    if(expenses.isNotEmpty) {
      return ListView.builder(
            shrinkWrap: true,
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense=expenses[index];
              final category=Expense.categories[expense.category];
              final isSameDay=(index!=0&&expense.date.day==expenses[index-1].date.day);
              return GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      isDismissible: false,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20))),
                      isScrollControlled: true,
                      builder: (BuildContext context) =>
                          ExpensePage(expense: expense,));
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        width:50,
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                          child: isSameDay?Column(
                            children: List.generate(150~/10, (index) => Expanded(
                              child: Container(
                                color: index%2==0?Colors.transparent
                                    :Colors.grey,
                                width: 2,
                              ),
                            )),
                          ):Column(
                            mainAxisAlignment: (index!=(expenses.length-1)&&expense.date.day==expenses[index+1].date.day)?MainAxisAlignment.end:MainAxisAlignment.center,
                            children: [
                              Text(
                                weekDays[expense.date.weekday-1].toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                expense.date.day.toString(),
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
                          padding:  EdgeInsets.only(right: 8,left:8,top: isSameDay?2:8),
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
                                      borderRadius:
                                      BorderRadius.circular(40),
                                      color: category.color,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          expense.expenseName.getOrCrash(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text("-\$${expense.amount.getOrCrash()}",
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
            });
    }else{
      return Container(margin:EdgeInsets.only(top: 20),alignment: Alignment.topCenter,child: Text("There are no transactions for the selected period.",style: TextStyle(color: Colors.grey[700]),));
    }
  },
);

    }, loadFailure: (_)=>const CriticalFailureCard());

  },
),
          ),
        )
      ],
    ));
  }
}
