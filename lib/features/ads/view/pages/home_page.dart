import 'package:aakrikada/core/colorpallets/colorpallets.dart';
import 'package:aakrikada/features/ads/view/widgets/listed_item_widget.dart';
import 'package:aakrikada/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Language provider
    final lang = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colorpallets.whiteColor,
        body: SafeArea(
          child: Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${lang.hi}, User",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colorpallets.primary,
                          ),
                        ),
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
                    const SizedBox(
                      height: 40,
                    ), // space between avatar and categories
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

              // TabBar
              Container(
                color: Colorpallets.whiteColor,
                padding: EdgeInsets.zero,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colorpallets.whiteColor,
                  unselectedLabelColor: Colorpallets.greyColor,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colorpallets.seconday,
                  ),
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: -12,
                    vertical: 6,
                  ),
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    Tab(text: lang.iron),
                    Tab(text: lang.newsPaper),
                    Tab(text: lang.electrolic),
                    Tab(text: lang.plastic),
                    Tab(text: lang.others),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  'Latest Listing',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    ListedItemWidget(),
                    Center(child: Text('Content 2')),
                    Center(child: Text('Content 3')),
                    Center(child: Text('Content 4')),
                    Center(child: Text('Content 5')),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'CREATE AN AD +',
            style: TextStyle(color: Colorpallets.whiteColor),
          ),
          backgroundColor: Colorpallets.pinkColor,
        ),
      ),
    );
  }
}
