import 'package:hive/hive.dart';

part 'financial_goal.g.dart';

@HiveType(typeId: 0)
class FinancialGoal extends HiveObject {

  @HiveField(0)
  String title;

  @HiveField(1)
  double targetAmount;

  @HiveField(2)
  double savedAmount;

  @HiveField(3)
  bool completed;

  @HiveField(4)
  String userId;

  @HiveField(5)
  DateTime createdAt;

  FinancialGoal({
    required this.title,
    required this.targetAmount,
    required this.userId,
    required this.createdAt,
    this.savedAmount = 0,
    this.completed = false,
  });
}