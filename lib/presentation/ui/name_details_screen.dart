import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

import '../data/mock_data.dart'; // for allahNames list

class NameDetailsScreen extends StatefulWidget {
  final Object? arguments;

  const NameDetailsScreen({super.key, this.arguments});

  @override
  State<NameDetailsScreen> createState() => _NameDetailsScreenState();
}

class _NameDetailsScreenState extends State<NameDetailsScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    // Find the index of the selected name
    final nameData =
        widget.arguments != null && widget.arguments is Map<String, String>
        ? widget.arguments as Map<String, String>
        : null;
    currentIndex = nameData != null
        ? allahNames.indexWhere(
            (element) => element["arabic"] == nameData["arabic"],
          )
        : 0;
  }

  void _goToNext() {
    setState(() {
      if (currentIndex < allahNames.length - 1) currentIndex++;
    });
  }

  void _goToPrevious() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameData = allahNames[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 16),
          color: kWhiteColor,
        ),
        centerTitle: true,
        title: Text(
          "Name Details",
          style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            /// Arabic Name Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: kSecondaryColor,
              shadowColor: Colors.teal.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Center(
                  child: Text(
                    nameData["arabic"] ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ScheherazadeNew', // optional Arabic font
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// English Meaning Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: kSecondaryColor,
              shadowColor: Colors.teal.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      nameData["english"] ?? "",
                      style: AppStyles.w600f18poppins.copyWith(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    if (nameData["meaning"] != null)
                      Text(
                        nameData["meaning"]!,
                        style: AppStyles.w400f14poppins.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Bottom navigation (Previous / Next)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: currentIndex > 0 ? _goToPrevious : null,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 28),
                  color: currentIndex > 0
                      ? kSecondaryColor
                      : Colors.grey.shade400,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kSecondaryColor),
                  ),
                  child: Text(
                    "${currentIndex + 1} / ${allahNames.length}",
                    style: AppStyles.w500f14poppins.copyWith(
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: currentIndex < allahNames.length - 1
                      ? _goToNext
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 28),
                  color: currentIndex < allahNames.length - 1
                      ? kSecondaryColor
                      : Colors.grey.shade400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
