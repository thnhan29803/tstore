import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar -- Tutorial [Section #3, Video #2]
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar -- Tutorial [Section #3, Video #4]
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories -- Tutorial [Section #3, Video #4]
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// -- Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body - Screen
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  // const TPromoVideoSlider(banners: [TVideos.video1, TVideos.video2, TVideos.video3]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // -- Heading
                  TSectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Popular Products
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
