import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  final Uuid _uuid = const Uuid();

  List<TransactionModel> get transactions => [..._transactions];

  List<TransactionModel> get recentTransactions {
    final recent = [..._transactions];
    recent.sort((a, b) => b.date.compareTo(a.date));
    return recent.take(5).toList();
  }

  double get totalBalance {
    return _transactions.fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalIncome {
    return _transactions
        .where((tx) => tx.type == 'income')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    // Note: expenses are already stored as negative amounts
    return _transactions
        .where((tx) => tx.type == 'expense')
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  TransactionProvider() {
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? transactionsString = prefs.getString('transactions');
    if (transactionsString != null) {
      final List<dynamic> decoded = json.decode(transactionsString);
      _transactions =
          decoded.map((item) => TransactionModel.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> encoded =
        _transactions.map((tx) => tx.toJson()).toList();
    await prefs.setString('transactions', json.encode(encoded));
  }

  void addTransaction(String title, double amount, String type) {
    // If expense, ensure amount is negative
    final finalAmount = type == 'expense' ? -amount.abs() : amount.abs();
    
    final newTransaction = TransactionModel(
      id: _uuid.v4(),
      title: title,
      amount: finalAmount,
      type: type,
      date: DateTime.now(),
    );

    _transactions.add(newTransaction);
    notifyListeners();
    _saveTransactions();
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
    _saveTransactions();
  }
}
