import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/transaction.dart';
import 'transaction_model.dart';

part 'totals_transaction_model.freezed.dart';

@freezed
class TotalsTransaction with _$TotalsTransaction {
  const factory TotalsTransaction({
    required double totalIncome,
    required double totalExpense,
    required double totalBalance,
  }) = _TotalsTransactionModel;

  factory TotalsTransaction.calcu(List<Transaction> transactions) {
    final totalExpense = transactions
        .where((transaction) => transaction.category == Category.expense)
        .map((transaction) => transaction.amount)
        .fold(0.0, (prev, amount) => prev + amount);

    final totalIncome = transactions
        .where((transaction) => transaction.category == Category.income)
        .map((transaction) => transaction.amount)
        .fold(0.0, (prev, amount) => prev + amount);

    return TotalsTransaction(
        totalExpense: totalExpense,
        totalIncome: totalIncome,
        totalBalance: totalIncome - totalExpense
    );
  }
}
