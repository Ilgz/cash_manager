import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart';
import 'package:cash_manager/presentation/core/routes/router.dart';
import 'package:cash_manager/presentation/core/utils/balance_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Row(
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: const [
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
              const Spacer(),
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Row(
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
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
