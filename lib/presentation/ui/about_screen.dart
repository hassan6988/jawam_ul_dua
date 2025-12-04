import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/generated/assets.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          "About",
          style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 🔹 App Icon
              Center(child: Image.asset(Assets.pngAssetsAppIcon, height: 120)),
              const SizedBox(height: 24),

              /// 🔹 App Name
              Text(
                "Jawam Ul Dua (جوامع الدعاء)",
                textAlign: TextAlign.center,
                style: AppStyles.w600f18poppins.copyWith(
                  color: Colors.teal.shade800,
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 Main About Card
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
                    "This application is dedicated to helping Muslims learn, memorize, and reflect upon the 99 beautiful names of Allah — "
                    "known as *jawam-ul-Dua*. Each name reflects one of Allah’s divine attributes, inspiring love, hope, and understanding "
                    "of His perfection.\n\n"
                    "Our mission is to encourage users to strengthen their faith by understanding the meanings and significance "
                    "behind each name. Through this app, we hope to make spiritual reflection and remembrance more accessible "
                    "and meaningful in daily life.\n\n"
                    "May this humble effort bring peace to your heart, light to your soul, and a closer connection to the Almighty.",
                    textAlign: TextAlign.justify,
                    style: AppStyles.w400f14poppins.copyWith(
                      color: Colors.grey.shade800,
                      height: 1.6,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// 🔹 Footer
              Column(
                children: [
                  Text(
                    "Developed with ❤️ for the love of learning God Names.",
                    textAlign: TextAlign.center,
                    style: AppStyles.w400f14poppins.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
