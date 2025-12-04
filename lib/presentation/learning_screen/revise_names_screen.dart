import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/presentation/bottom_navbar/custom_bottom_navbar.dart';
import 'package:jawam_ul_dua/presentation/learning_screen/learning_screen.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

class ReviseNamesScreen extends StatefulWidget {
  const ReviseNamesScreen({super.key});

  @override
  State<ReviseNamesScreen> createState() => _ReviseNamesScreenState();
}

class _ReviseNamesScreenState extends State<ReviseNamesScreen> {
  final PageController _pageController = PageController();
  List<Map<String, dynamic>> quizQuestions = [];
  final Map<int, String> selectedAnswers = {};
  int score = 0;

  @override
  void initState() {
    super.initState();
    _generateQuiz();
  }

  void _generateQuiz() {
    final convertedBaseNames = baseNames
        .where((item) => item['meaning'] != null && item['meaning']!.isNotEmpty)
        .map((item) => Map<String, dynamic>.from(item))
        .toList();

    if (convertedBaseNames.length < 4) return; // avoid quiz if too small

    // Shuffle & take 10 random unique names
    quizQuestions = List<Map<String, dynamic>>.from(convertedBaseNames)
      ..shuffle();
    quizQuestions = quizQuestions.take(10).toList();

    // Generate 3 wrong options for each question
    for (var q in quizQuestions) {
      final others = List<Map<String, dynamic>>.from(convertedBaseNames)
        ..removeWhere((element) => element['meaning'] == q['meaning'])
        ..shuffle();

      final correctMeaning = q['meaning'] ?? "Unknown";
      final wrongOptions = others
          .take(3)
          .map((e) => e['meaning'] ?? "")
          .toList();

      q['options'] = ([correctMeaning, ...wrongOptions]..shuffle());
    }
  }

  void _nextPage() {
    if (_pageController.page!.round() < quizQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _calculateScore();
    }
  }

  void _calculateScore() {
    score = 0;
    for (var i = 0; i < quizQuestions.length; i++) {
      if (selectedAnswers[i] == quizQuestions[i]['meaning']) {
        score++;
      }
    }
    _showResultDialog();
  }

  void _showResultDialog() {
    String message;
    String title;
    IconData icon;
    Color iconColor;

    if (score <= 4) {
      title = "Keep Learning!";
      message =
          "You need more learning. Keep studying and try again, in shaa Allah.";
      icon = Icons.sentiment_dissatisfied_rounded;
      iconColor = Colors.redAccent;
    } else if (score <= 7) {
      title = "Good Progress!";
      message =
          "You’re getting there. A little more effort and you'll master the meanings soon!";
      icon = Icons.emoji_emotions_rounded;
      iconColor = Colors.orangeAccent;
    } else if (score <= 9) {
      title = "Great Job!";
      message =
          "You’re mastering the beautiful Names of Allah. Keep revising and reflecting on them!";
      icon = Icons.emoji_events_rounded;
      iconColor = Colors.green;
    } else {
      title = "Excellent!";
      message =
          "Masha’Allah! You’ve truly learned the Names of Allah with heart and dedication.";
      icon = Icons.star_rounded;
      iconColor = kSecondaryColor;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🌸 Icon
                CircleAvatar(
                  radius: 36,
                  backgroundColor: iconColor.withValues(alpha: 0.1),
                  child: Icon(icon, color: iconColor, size: 40),
                ),
                const SizedBox(height: 16),

                // 🌙 Title
                Text(
                  title,
                  style: AppStyles.w700f20poppins.copyWith(
                    color: kSecondaryColor,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // 📖 Score
                Text(
                  "Your Score: $score / 10",
                  style: AppStyles.w600f16poppins.copyWith(
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),

                // 💬 Message
                Text(
                  message,
                  style: AppStyles.w400f14poppins.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // ✅ OK Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomBottomNavBar(index: 1),
                        ),
                        (_) => false,
                      );
                    },
                    child: Text(
                      "OK",
                      style: AppStyles.w600f16poppins.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          "Revise Names",
          style: AppStyles.w500f18poppins.copyWith(color: kWhiteColor),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quizQuestions.length,
            itemBuilder: (context, index) {
              final question = quizQuestions[index];
              final options = (question['options'] as List)
                  .map((e) => e.toString())
                  .toList();
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Question ${index + 1} of 10",
                        style: AppStyles.w600f16poppins.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        question["arabic"] ?? "",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: kScaffoldColor,
                          fontFamily: 'ScheherazadeNew',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        question["name"] ?? "",
                        style: AppStyles.w700f20poppins.copyWith(
                          color: kSecondaryColor,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),

                      /// 🟢 Radio Buttons
                      Column(
                        children: options.map((option) {
                          final isSelected = selectedAnswers[index] == option;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswers[index] = option;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? kSecondaryColor.withValues(alpha: 0.1)
                                    : Colors.white,
                                border: Border.all(
                                  color: isSelected
                                      ? kSecondaryColor
                                      : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? kSecondaryColor
                                            : Colors.grey.shade400,
                                        width: 2,
                                      ),
                                      color: isSelected
                                          ? kSecondaryColor
                                          : Colors.transparent,
                                    ),
                                    child: isSelected
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      option,
                                      style: AppStyles.w600f16poppins.copyWith(
                                        color: isSelected
                                            ? kSecondaryColor
                                            : kBlackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const Spacer(),

                      /// 🔹 Next Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: selectedAnswers[index] == null
                              ? null
                              : _nextPage,
                          child: Text(
                            index == quizQuestions.length - 1
                                ? "Finish"
                                : "Next",
                            style: AppStyles.w600f16poppins.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
