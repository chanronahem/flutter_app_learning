import 'package:flutter/material.dart';
import 'package:flutter_app_learning/common/widgets/appbar/appbar.dart';
import 'package:flutter_app_learning/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app_learning/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app_learning/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app_learning/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_app_learning/common/widgets/texts/section_heading.dart';
import 'package:flutter_app_learning/utils/constants/enums.dart';
import 'package:flutter_app_learning/utils/constants/image_strings.dart';
import 'package:flutter_app_learning/utils/constants/sizes.dart';

import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text('Store', style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
          actions: [TCardCounterIcon(onPressed: () {}, iconColor: dark ? TColors.white : TColors.black)],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [

                        /// Search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// Featured Brands
                        TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        TGridLayout(itemCount: 4, mainAxisExtent: 80,itemBuilder: (_, index){
                          return GestureDetector(
                            onTap: (){},
                            child: TRoundedContainer(
                              padding: const EdgeInsets.all(TSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [

                                  /// Icon
                                  Flexible(
                                    child: TCircularImage(
                                      isNetworkImage: false,
                                      image: TImages.clothIcon,
                                      backgroundColor: Colors.transparent,
                                      overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                                    ),
                                  ),
                                  const SizedBox(width: TSizes.spaceBtwItems / 2),

                                  /// Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                        Text(
                                          '256 products',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: Container()));
  }
}
