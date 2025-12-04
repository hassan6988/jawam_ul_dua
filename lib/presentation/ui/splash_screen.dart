import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jawam_ul_dua/presentation/bottom_navbar/custom_bottom_navbar.dart';
import 'package:jawam_ul_dua/presentation/ui/pdf_view_screen.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:path_provider/path_provider.dart';

import '../../generated/assets.dart';
import '../../utils/const/responsive_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), _decideNavigation);
  }

  void _decideNavigation() {
    final DateTime appStartDate = DateTime(2025, 11, 18);
    final now = DateTime.now();

    final difference = now.isBefore(appStartDate);
    if (difference) {
      _navigateToHomeScreen();
    } else {
      _navigateToPDFViewer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Center(
          child: Image.asset(
            Assets.pngAssetsAppIcon,
            height: getProportionateScreenHeight(202),
          ),
        ),
      ),
    );
  }

  void _navigateToPDFViewer() async {
    if (!mounted) return;

    try {
      final ByteData bytes = await rootBundle.load(Assets.assetsJawamUlDua);
      final Uint8List list = bytes.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/asma_ul_husna.pdf');
      await file.writeAsBytes(list);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PDFViewerScreen(pdfPath: file.path, title: "جوامع الدعاء"),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error loading PDF: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CustomBottomNavBar()),
    );
  }
}
