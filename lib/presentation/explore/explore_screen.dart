import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/generated/assets.dart';
import 'package:jawam_ul_dua/router/app_routes.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/const/styles.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  final List<Map<String, String>> videos = const [
    {
      'title': 'The Power of Dhikr',
      'url': 'https://youtu.be/NquPiHmt59s?si=Ry0YC7MQJol5m4CP',
      'thumbnail': 'https://i.ytimg.com/vi/NquPiHmt59s/maxresdefault.jpg',
    },
    {
      'title': 'The 99 Names of Allah',
      'url': 'https://youtu.be/g3yG6rU9Uys?si=ZIei975ujB4SEZvB',
      'thumbnail':
          'https://thequrancourses.com/our-blog/wp-content/uploads/2022/02/99-Names-of-Allah-1024x538.png',
    },
  ];
  final List<String> sliderImages = [
    Assets.pngAssetsHadith,
    Assets.pngAssetsHadith2,
    Assets.pngAssetsHadith3,
    Assets.pngAssetsHadith4,
  ];

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      try {
        // Try external app (YouTube app or browser)
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );

        if (!launched) {
          // Fallback to in-app webview if external fails
          await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
        }
      } catch (e) {
        debugPrint('Launch failed, trying fallback: $e');
        await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      }
    } else {
      debugPrint('Cannot launch URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Explore",
          style: AppStyles.w500f18poppins.copyWith(color: kWhiteColor),
        ),
        backgroundColor: kSecondaryColor,
        foregroundColor: kWhiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: sliderImages.length,
              options: CarouselOptions(
                height: 220,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 0.90,
                onPageChanged: (index, _) {
                  setState(() => _currentIndex = index);
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(sliderImages[index], fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: _currentIndex == entry.key ? 15 : 8,
                    height: 6,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: _currentIndex == entry.key
                          ? kSecondaryColor
                          : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              '📺 Watch & Learn',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return GestureDetector(
                    onTap: () => _launchURL(video['url']!),
                    child: Container(
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              video['thumbnail']!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              video['title']!,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '⚙️ More Options',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: kPrimaryColor,
              ),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, RouteName.privacyPolicy);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: kPrimaryColor),
              title: const Text('About Us'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, RouteName.aboutScreen);
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Made with ❤️ for Islamic Learning',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
