import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

class AboutAuthorScreen extends StatelessWidget {
  const AboutAuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        foregroundColor: kWhiteColor,
        backgroundColor: kSecondaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 16),
          color: kWhiteColor,
        ),
        centerTitle: true,
        title: Text(
          "About the Author",
          style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header title
            Text(
              "The Perfect Names of God (Allah):",
              style: AppStyles.w600f18poppins.copyWith(
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Their Grandeur, Sublimity and Benefits, in Light of the Book and Al-Sunnah",
              style: AppStyles.w500f14poppins.copyWith(
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),

            /// Author & Translator
            _buildInfoCard(title: "By:", content: "Maher Bin Moqaddam"),
            _buildInfoCard(
              title: "Translation by:",
              content: "Malek Abdul Hameed — Kuwait",
            ),

            const SizedBox(height: 16),

            _buildParagraphCard(
              content:
                  "*This is the summarized version of the book.*\n\nThese Names were all approved by The General Mufti of Saudi Arabia, Sheikh Abdul Aazeez Al-Sheikh — may God bless him.\n\nAll rights reserved. Reprinting and distribution is allowed only without any modification.",
            ),

            const SizedBox(height: 16),

            _buildInfoCard(title: "First Edition:", content: "1430 H — 2009"),
            _buildInfoCard(
              title: "Approval:",
              content:
                  "The Arabic version has the approval of the Saudi Ministry of Information under number 268589, dated 6/8/1431 Hijri.",
            ),

            const SizedBox(height: 20),

            Text(
              "Introductions By:",
              style: AppStyles.w600f16poppins.copyWith(color: kSecondaryColor),
            ),
            const SizedBox(height: 8),

            _buildIntroPoint(
              "1) Sheikh Shuaib Al-Arnaoott, the best reference for hadeeth.",
            ),
            _buildIntroPoint(
              "2) Dr. Muhammad Al-Tabtabaie, former Dean of Islamic Studies at Kuwait University.",
            ),
            _buildIntroPoint(
              "3) Dr. Mahmood Al-Reddwani, Professor of Contemporary Religions.",
            ),

            const SizedBox(height: 30),

            Center(
              child: Text(
                "May Allah reward them all for their service to knowledge.",
                textAlign: TextAlign.center,
                style: AppStyles.w400f13poppins.copyWith(
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// --- Helper Widgets ---
  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      elevation: 2,
      shadowColor: Colors.teal.withValues(alpha: .1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: RichText(
          text: TextSpan(
            text: "$title ",
            style: AppStyles.w500f16poppins.copyWith(color: kSecondaryColor),
            children: [
              TextSpan(
                text: content,
                style: AppStyles.w400f14poppins.copyWith(
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraphCard({required String content}) {
    return Card(
      elevation: 2,
      shadowColor: Colors.teal.withValues(alpha: .1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          content,
          textAlign: TextAlign.justify,
          style: AppStyles.w400f14poppins.copyWith(
            color: Colors.grey.shade800,
            height: 1.6,
          ),
        ),
      ),
    );
  }

  Widget _buildIntroPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: AppStyles.w400f14poppins.copyWith(
          color: Colors.grey.shade800,
          height: 1.5,
        ),
      ),
    );
  }
}
