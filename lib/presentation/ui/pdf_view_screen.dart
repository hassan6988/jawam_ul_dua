import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/custom_action_button.dart';
import 'package:jawam_ul_dua/utils/const/responsive_config.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfPath;
  final String title;

  const PDFViewerScreen({
    super.key,
    required this.pdfPath,
    required this.title,
  });

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFViewController? _controller;
  SharedPreferences? _prefs;

  String? _pdfPath;
  bool _loading = true;
  String? _error;
  bool _showUI = true;
  int _currentPage = 0;
  int _totalPages = 0;
  bool _isDraggingScrollbar = false;

  String get _pageKey => 'page_${widget.pdfPath.hashCode}';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final futures = await Future.wait([
        SharedPreferences.getInstance(),
        SimplePdfCache.get(widget.pdfPath),
      ]);

      _prefs = futures[0] as SharedPreferences;
      _pdfPath = futures[1] as String;
      _currentPage = _prefs!.getInt(_pageKey) ?? 0;

      setState(() => _loading = false);
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _onPageChanged(int? page, int? total) {
    if (page != null && page != _currentPage && !_isDraggingScrollbar) {
      setState(() => _currentPage = page);
      _prefs?.setInt(_pageKey, page);
    }
  }

  void _toggleUI() {
    if (!_isDraggingScrollbar) {
      setState(() => _showUI = !_showUI);
    }
  }

  void _showPageDialog() {
    if (_totalPages == 0) return;

    final controller = TextEditingController(text: '${_currentPage + 1}');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Go to Page',
          style: AppStyles.w500f18poppins.copyWith(color: kSecondaryColor),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Page (1-$_totalPages)',
            labelStyle: AppStyles.w400f12poppins.copyWith(
              color: kSecondaryColor,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor),
            ),
            focusColor: kSecondaryColor,
          ),
          autofocus: true,
          onSubmitted: (value) => _navigateToPage(controller, context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppStyles.w500f12poppins.copyWith(color: kSecondaryColor),
            ),
          ),
          TextButton(
            onPressed: () => _navigateToPage(controller, context),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
                vertical: getProportionateScreenHeight(8),
              ),
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Go',
                style: AppStyles.w400f12poppins.copyWith(color: kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(
    TextEditingController controller,
    BuildContext dialogContext,
  ) {
    final page = int.tryParse(controller.text);
    if (page == null || page < 1 || page > _totalPages) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Enter page 1-$_totalPages')));
      return;
    }

    Navigator.pop(dialogContext);
    _controller?.setPage(page - 1);
  }

  void _handleScrollbarInteraction(
    Offset localPosition,
    double scrollbarHeight,
  ) {
    if (_totalPages <= 1) return;
    final tapPosition = localPosition.dy.clamp(0.0, scrollbarHeight);
    final progress = tapPosition / scrollbarHeight;
    final targetPage = (progress * (_totalPages - 1)).round();

    if (targetPage != _currentPage) {
      setState(() => _currentPage = targetPage);
      _controller?.setPage(targetPage);
      _prefs?.setInt(_pageKey, targetPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => _prefs?.setInt(_pageKey, _currentPage),
      child: Scaffold(
        appBar: _showUI
            ? AppBar(
                centerTitle: true,
                title: Text(
                  widget.title,
                  style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
                ),
                backgroundColor: kSecondaryColor,
                foregroundColor: kWhiteColor,
                actions: _totalPages > 0
                    ? [
                        IconButton(
                          onPressed: _showPageDialog,
                          icon: const Icon(Icons.search),
                          tooltip: 'Go to page',
                        ),
                      ]
                    : null,
              )
            : null,

        body: _loading
            ? _buildLoading()
            : _error != null
            ? _buildError()
            : SafeArea(child: _buildPDF()),
      ),
    );
  }

  Widget _buildLoading() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: kSecondaryColor),
        SizedBox(height: getProportionateScreenHeight(16)),
        Text('Loading...'),
      ],
    ),
  );

  Widget _buildError() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error, size: 48, color: Colors.red),
        SizedBox(height: getProportionateScreenHeight(16)),
        Text('Error: $_error', textAlign: TextAlign.center),
        SizedBox(height: getProportionateScreenHeight(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomActionButton(
              buttonText: "Retry",
              onTap: () {
                setState(() {
                  _loading = true;
                  _error = null;
                });
                _init();
              },
            ),
            SizedBox(width: getProportionateScreenWidth(16)),
            CustomActionButton(
              buttonText: "Back",
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildPDF() => Stack(
    children: [
      PDFView(
        filePath: _pdfPath!,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: Platform.isIOS ? true : false,
        pageFling: false,
        pageSnap: true,
        fitPolicy: FitPolicy.BOTH,
        defaultPage: _currentPage,
        preventLinkNavigation: false,
        onViewCreated: (controller) {
          _controller = controller;
          if (_currentPage > 0) {
            Future.delayed(const Duration(milliseconds: 200), () {
              controller.setPage(_currentPage);
            });
          }
        },
        onRender: (pages) {
          setState(() => _totalPages = pages ?? 0);
        },
        onPageChanged: _onPageChanged,
        onError: (error) => setState(() => _error = error.toString()),
      ),
      Positioned.fill(
        child: GestureDetector(
          onTap: _toggleUI,
          behavior: HitTestBehavior.translucent,
        ),
      ),
      if (_showUI && _totalPages > 0)
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _showPageDialog,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_currentPage + 1} / $_totalPages',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      if (_showUI && _totalPages > 1)
        Positioned(
          right: 8,
          top: 60,
          bottom: 60,
          width: getProportionateScreenWidth(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final scrollbarHeight = constraints.maxHeight;

              return GestureDetector(
                onTapDown: (details) {
                  setState(() => _isDraggingScrollbar = true);
                  _handleScrollbarInteraction(
                    details.localPosition,
                    scrollbarHeight,
                  );
                },
                onTapUp: (_) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (mounted) {
                      setState(() => _isDraggingScrollbar = false);
                    }
                  });
                },
                onPanStart: (_) {
                  setState(() => _isDraggingScrollbar = true);
                },
                onPanUpdate: (details) {
                  _handleScrollbarInteraction(
                    details.localPosition,
                    scrollbarHeight,
                  );
                },
                onPanEnd: (_) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (mounted) {
                      setState(() => _isDraggingScrollbar = false);
                    }
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: getProportionateScreenWidth(20),
                  decoration: BoxDecoration(
                    color: _isDraggingScrollbar
                        ? Colors.grey.withValues(alpha: 0.5)
                        : Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final thumbHeight = (scrollbarHeight / _totalPages)
                              .clamp(30.0, 40.0);
                          final thumbPosition = _totalPages > 1
                              ? (_currentPage / (_totalPages - 1)) *
                                    (scrollbarHeight - thumbHeight)
                              : 0.0;

                          return Positioned(
                            top: thumbPosition,
                            left: 8,
                            child: Container(
                              width: getProportionateScreenWidth(8),
                              height: thumbHeight,
                              decoration: BoxDecoration(
                                color: _isDraggingScrollbar
                                    ? kPrimaryColor.withValues(alpha: 0.7)
                                    : kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: _isDraggingScrollbar
                                    ? [
                                        BoxShadow(
                                          color: kPrimaryColor.withValues(
                                            alpha: 0.3,
                                          ),
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                        ),
                                      ]
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
    ],
  );

  @override
  void dispose() {
    SimplePdfCache.clear(widget.pdfPath);
    super.dispose();
  }
}

class SimplePdfCache {
  static final Map<String, String> _cache = {};
  static final Map<String, Completer<String>> _pending = {};

  static Future<String> get(String path) async {
    if (_cache.containsKey(path) && await File(_cache[path]!).exists()) {
      return _cache[path]!;
    }

    if (_pending.containsKey(path)) {
      return _pending[path]!.future;
    }

    final completer = Completer<String>();
    _pending[path] = completer;

    try {
      final result = await compute(_processPdfFile, path);
      _cache[path] = result;
      completer.complete(result);
      return result;
    } catch (e) {
      completer.completeError(e);
      rethrow;
    } finally {
      _pending.remove(path);
    }
  }

  static void clear(String path) {
    final cached = _cache[path];
    if (cached != null && cached != path) {
      File(cached).delete().catchError((_) {});
    }
    _cache.remove(path);
  }
}

Future<String> _processPdfFile(String path) async {
  final file = File(path);
  if (!await file.exists()) throw 'File not found';

  final bytes = await file.readAsBytes();
  if (bytes.length < 4) throw 'Invalid file';
  if (String.fromCharCodes(bytes.take(4)) == '%PDF') return path;
  final dir = await getTemporaryDirectory();
  final tempFile = File('${dir.path}/pdf_${path.hashCode.abs()}.pdf');
  await tempFile.writeAsBytes(bytes);
  return tempFile.path;
}
