import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

import '../learning_screen/learning_screen.dart';
import '../learning_screen/revise_names_screen.dart';
import '../widgets/hadith_corousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        foregroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(
          "Home",
          style: AppStyles.w500f18poppins.copyWith(color: kWhiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 🌙 Greeting Card
              _buildGreetingCard(),

              const SizedBox(height: 20),

              /// 📿 Hadith Carousel
              const HadithCarousel(),

              const SizedBox(height: 24),

              /// 📘 Quick Actions
              Text(
                "Continue Your Journey",
                style: AppStyles.w600f16poppins.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionCard(
                      icon: Icons.menu_book_rounded,
                      title: "Learn Names",
                      color: kSecondaryColor.withOpacity(0.9),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LearningScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionCard(
                      icon: Icons.quiz_rounded,
                      title: "Revise / Quiz",
                      color: kPrimaryColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviseNamesScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// 💫 Reflection of the Day
              _buildReflectionCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingCard() {
    final now = DateTime.now();
    final greeting = now.hour < 12
        ? "Good Morning ☀️"
        : now.hour < 18
        ? "Good Afternoon 🌤️"
        : "Good Evening 🌙";

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kSecondaryColor, kPrimaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: AppStyles.w600f16poppins.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Welcome back! Continue exploring the beautiful Names of Allah.",
            style: AppStyles.w400f14poppins.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppStyles.w600f16poppins.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReflectionCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "🕋 Reflection of the Day",
            style: AppStyles.w600f18poppins.copyWith(color: kSecondaryColor),
          ),
          const SizedBox(height: 10),
          Text(
            "“When you learn the Names of Allah, you don’t just memorize — you connect your heart to the Creator.”",
            style: AppStyles.w400f14poppins.copyWith(
              color: Colors.black87,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
