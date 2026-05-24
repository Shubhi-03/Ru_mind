import 'package:flutter/material.dart';
import 'package:brain_train/services/financial_goal.dart';

class FinancialGoalsScreen extends StatefulWidget {
  const FinancialGoalsScreen({super.key});

  @override
  State<FinancialGoalsScreen> createState() =>
      _FinancialGoalsScreenState();
}

class _FinancialGoalsScreenState
    extends State<FinancialGoalsScreen> {

  final List<FinancialGoal> _goals = [];

  final TextEditingController _goalController =
      TextEditingController();

  // 🌸 Theme Colors (matching your app)
  final Color primaryPurple = const Color(0xFF7E57C2);
  final Color lightPurple = const Color(0xFFF3ECFF);
  final Color cardColor = const Color(0xFFF8F3FF);

  void _addGoal() {
    if (_goalController.text.trim().isEmpty) return;

    setState(() {
      _goals.add(
        FinancialGoal(
          title: _goalController.text.trim(),
        ),
      );
    });

    _goalController.clear();
  }

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  void _toggleGoal(int index, bool? value) {
    setState(() {
      _goals[index].isCompleted = value ?? false;
    });
  }

  void _showAddGoalDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 24,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Drag Handle
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Add Financial Goal',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _goalController,
                decoration: InputDecoration(
                  hintText: 'Ex: Buy Laptop',
                  filled: true,
                  fillColor: lightPurple,
                  prefixIcon: Icon(
                    Icons.flag_rounded,
                    color: primaryPurple,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    _addGoal();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add Goal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightPurple,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryPurple,
        title: const Text(
          'Financial Goals',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryPurple,
        onPressed: _showAddGoalDialog,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Goal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: _goals.isEmpty

          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [

                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple
                              .withOpacity(0.08),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.flag_rounded,
                      size: 60,
                      color: primaryPurple,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'No Financial Goals Yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Track your savings and\nachieve your dreams 🎯',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: _goals.length,
              itemBuilder: (context, index) {

                final goal = _goals[index];

                return AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 300),

                  margin:
                      const EdgeInsets.only(bottom: 18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Row(
                      children: [

                        // Checkbox Area
                        GestureDetector(
                          onTap: () {
                            _toggleGoal(
                              index,
                              !goal.isCompleted,
                            );
                          },

                          child: AnimatedContainer(
                            duration:
                                const Duration(
                                    milliseconds: 250),

                            width: 28,
                            height: 28,

                            decoration: BoxDecoration(
                              color: goal.isCompleted
                                  ? Colors.green
                                  : Colors.transparent,

                              borderRadius:
                                  BorderRadius.circular(10),

                              border: Border.all(
                                color: goal.isCompleted
                                    ? Colors.green
                                    : primaryPurple,
                                width: 2,
                              ),
                            ),

                            child: goal.isCompleted
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : null,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Goal Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                goal.title,

                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.bold,

                                  color: goal.isCompleted
                                      ? Colors.grey
                                      : Colors.black87,

                                  decoration:
                                      goal.isCompleted
                                          ? TextDecoration
                                              .lineThrough
                                          : TextDecoration
                                              .none,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                children: [

                                  Icon(
                                    goal.isCompleted
                                        ? Icons
                                            .check_circle
                                        : Icons
                                            .trending_up,
                                    size: 18,
                                    color:
                                        goal.isCompleted
                                            ? Colors.green
                                            : primaryPurple,
                                  ),

                                  const SizedBox(width: 6),

                                  Text(
                                    goal.isCompleted
                                        ? 'Completed'
                                        : 'In Progress',

                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w500,

                                      color:
                                          goal.isCompleted
                                              ? Colors.green
                                              : primaryPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Delete Button
                        IconButton(
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red.shade300,
                          ),
                          onPressed: () {
                            _deleteGoal(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}