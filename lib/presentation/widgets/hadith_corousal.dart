import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/mock_data.dart';

class HadithCarousel extends StatefulWidget {
  const HadithCarousel({super.key});

  @override
  State<HadithCarousel> createState() => _HadithCarouselState();
}

class _HadithCarouselState extends State<HadithCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- Carousel area ---
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: hadiths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final hadith = hadiths[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hadith["icon"] ?? "",
                            style: const TextStyle(fontSize: 36),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            hadith["text"]!,
                            textAlign: TextAlign.center,
                            style: AppStyles.w400f14poppins.copyWith(
                              color: Colors.grey.shade800,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              hadith["reference"]!,
                              style: AppStyles.w400f12poppins.copyWith(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // --- Backward arrow ---
                // Positioned(
                //   left: 0,
                //   child: IconButton(
                //     icon: const Icon(Icons.arrow_back_ios, size: 20),
                //     color: Colors.grey.shade700,
                //     onPressed: () {
                //       if (_currentPage > 0) {
                //         _pageController.previousPage(
                //           duration: const Duration(milliseconds: 400),
                //           curve: Curves.easeInOut,
                //         );
                //       }
                //     },
                //   ),
                // ),
                //
                // // --- Forward arrow ---
                // Positioned(
                //   right: 0,
                //   child: IconButton(
                //     icon: const Icon(Icons.arrow_forward_ios, size: 20),
                //     color: Colors.grey.shade700,
                //     onPressed: () {
                //       if (_currentPage < hadiths.length - 1) {
                //         _pageController.nextPage(
                //           duration: const Duration(milliseconds: 400),
                //           curve: Curves.easeInOut,
                //         );
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // --- Dots indicator ---
          SmoothPageIndicator(
            controller: _pageController,
            count: hadiths.length,
            effect: ExpandingDotsEffect(
              activeDotColor: kSecondaryColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
