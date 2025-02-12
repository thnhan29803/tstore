import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(

        /// -- Appbar
          appBar: TAppBar(
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [TCartCounterIcon(onPressed: () {})],
          ),
          body: NestedScrollView(
            /// -- Header
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: 440,
                    automaticallyImplyLeading: false,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// --Search bar
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TSearchContainer(
                              text: 'Search in Store',
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          /// --Featured Brands
                          TSectionHeading(
                              title: 'Featured Brands', onPressed: () {}),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                          /// Brand Grid
                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(showBorder: true);
                              }),
                        ],
                      ),
                    ),

                    /// Tabs
                    bottom: const TTabBar(tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ])),
              ];
            },

            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            ),
          )),
    );
  }
}
