import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/domain/model/categories_model.dart';
import 'package:aakrikada/features/ads/view/pages/create_ads_page.dart';
import 'package:aakrikada/features/ads/view/pages/home/all_category_page.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.categoryModel});
  final List<Category>? categoryModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 6,
      child: categoryModel != null
          ? Scaffold(
              backgroundColor: Colorpallets.whiteColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Container with everything inside
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0xFFDCFFF1), Color(0xFFCEF0FC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // user welcome
                              Text(
                                "${lang.hi}, User",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colorpallets.primary,
                                ),
                              ),
                              // user profile image
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/img_avathar.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                lang.categories,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                lang.viewAll,
                                style: TextStyle(color: Colorpallets.greyColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // TabBar
                  Container(
                    color: Colorpallets.whiteColor,
                    padding: EdgeInsets.zero,
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colorpallets.blackColor,
                      unselectedLabelColor: Colorpallets.greyColor,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.transparent,
                      ),
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: -12,
                        vertical: 6,
                      ),
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: lang.all),
                        Tab(
                          icon: Image.network(
                            categoryModel![0].categoryImage,
                            height: 42,
                          ),
                          text: lang.iron,
                        ),
                        Tab(
                          icon: Image.network(
                            categoryModel![1].categoryImage,
                            height: 42,
                          ),
                          text: lang.newsPaper,
                        ),
                        Tab(
                          icon: Image.network(
                            categoryModel![2].categoryImage,
                            height: 42,
                          ),
                          text: lang.electrolic,
                        ),
                        Tab(
                          icon: Image.network(
                            categoryModel![3].categoryImage,
                            height: 42,
                          ),
                          text: lang.plastic,
                        ),
                        Tab(
                          icon: Image.network(
                            categoryModel![4].categoryImage,
                            height: 42,
                          ),
                          text: lang.others,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      lang.latestList,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        // ListedItemWidget(),
                        AllCategoryPage(),
                        Center(child: Text('Content 1')),
                        Center(child: Text('Content 2')),
                        Center(child: Text('Content 3')),
                        Center(child: Text('Content 4')),
                        Center(child: Text('Content 5')),
                      ],
                    ),
                  ),
                ],
              ),

              // create btn
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAdPage()),
                  );
                },
                label: Text(
                  '${lang.createAd} +',
                  style: TextStyle(color: Colorpallets.whiteColor),
                ),
                backgroundColor: Colorpallets.pinkColor,
              ),
            )
          : Center(
              child: CircularProgressIndicator(color: Colorpallets.primary),
            ),
    );
  }
}
