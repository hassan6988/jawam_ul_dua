import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/presentation/ui/custom_drawer.dart';
import 'package:jawam_ul_dua/utils/const/colors.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router/app_routes.dart';
import '../data/mock_data.dart';

class AllahNamesScreen extends StatefulWidget {
  const AllahNamesScreen({super.key});

  @override
  State<AllahNamesScreen> createState() => _AllahNamesScreenState();
}

class _AllahNamesScreenState extends State<AllahNamesScreen> {
  final Set<int> favoriteIndexes = {};
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  /// Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? saved = prefs.getStringList("favorites");
    if (saved != null) {
      setState(() {
        favoriteIndexes.addAll(saved.map(int.parse));
      });
    }
  }

  /// Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      "favorites",
      favoriteIndexes.map((e) => e.toString()).toList(),
    );
  }

  void _toggleFavorite(int index) {
    setState(() {
      if (favoriteIndexes.contains(index)) {
        favoriteIndexes.remove(index);
      } else {
        favoriteIndexes.add(index);
      }
    });
    _saveFavorites(); // persist after change
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> visibleList = _selectedIndex == 0
        ? allahNames
        : allahNames
              .asMap()
              .entries
              .where((entry) => favoriteIndexes.contains(entry.key))
              .map((entry) => entry.value)
              .toList();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _selectedIndex == 0 ? 'Names of God' : 'Favorites',
          style: AppStyles.w600f18poppins.copyWith(color: kWhiteColor),
        ),
        backgroundColor: kSecondaryColor,
        foregroundColor: kWhiteColor,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: visibleList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final originalIndex = _selectedIndex == 0
              ? index
              : allahNames.indexOf(visibleList[index]);

          final isFav = favoriteIndexes.contains(originalIndex);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.nameDetailsScreen,
                arguments: visibleList[index],
              );
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  child: Text(
                    "${originalIndex + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  visibleList[index]["arabic"]!,
                  textAlign: TextAlign.right,
                  style: AppStyles.w500f14poppins.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(
                        visibleList[index]["english"]!,
                        textAlign: TextAlign.left,
                        style: AppStyles.w500f14poppins.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, anim) =>
                              ScaleTransition(scale: anim, child: child),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey(isFav),
                            color: isFav
                                ? Colors.redAccent
                                : Colors.grey.shade600,
                            size: 28,
                          ),
                        ),
                        onPressed: () => _toggleFavorite(originalIndex),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
