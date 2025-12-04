import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          "Privacy Policy",
          style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy for Jawam Ul Dua",
                style: AppStyles.w600f18poppins.copyWith(
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 2,
                shadowColor: Colors.teal.withValues(alpha: .1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: kWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Your privacy is very important to us. This Privacy Policy explains how the *Jawam Ul Dua* app collects, uses, and protects your information.\n\n"
                    "We value your trust and are committed to ensuring that your personal data remains safe and secure.",
                    textAlign: TextAlign.justify,
                    style: AppStyles.w400f14poppins.copyWith(
                      color: Colors.grey.shade800,
                      height: 1.6,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _buildSection(
                title: "1. Information We Collect",
                content:
                    "This app does not collect any personally identifiable information. All data such as progress is stored locally on your device and never shared externally.",
              ),

              _buildSection(
                title: "2. How We Use Information",
                content:
                    "Any data saved on your device (like your reading progress) is used solely to enhance your personal experience. We do not transmit or sell any information to third parties.",
              ),

              _buildSection(
                title: "3. Third-Party Services",
                content:
                    "The app may use third-party services such as Google Play Services or Firebase Analytics to improve app performance. These services may collect anonymous usage data in accordance with their own privacy policies.",
              ),

              _buildSection(
                title: "4. Data Security",
                content:
                    "We use the latest mobile security best practices to keep your data safe. Since your personal information is not transmitted or stored online, there is minimal risk of exposure.",
              ),

              _buildSection(
                title: "5. Your Consent",
                content:
                    "By using this app, you consent to our Privacy Policy and agree to its terms.",
              ),

              _buildSection(
                title: "6. Changes to This Policy",
                content:
                    "We may update this Privacy Policy from time to time. Any updates will be reflected in the app and take effect immediately upon posting.",
              ),

              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Last updated: November 2025",
                  style: AppStyles.w400f12poppins.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget for reusable policy sections
  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 2,
        shadowColor: Colors.teal.withValues(alpha: .1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.w600f16poppins.copyWith(
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                textAlign: TextAlign.justify,
                style: AppStyles.w400f14poppins.copyWith(
                  color: Colors.grey.shade800,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
