import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../widget/advertisments_of_app.dart';
import '../../widget/app_bar_widget.dart';
import '../../widget/button_navigator_bar_widget.dart';
import '../../widget/text_title_of_categories.dart';
import '../widget/list_view_main_components.dart';
import '../widget/popular_product_widgets/widget_of_popular_medicines_widget.dart';
import '../widget/product_on_sale_widgets/list_view_of_products_on_sale_widget.dart';
import '../widget/recent_doctors_widget/list_view_of_recent_doctors_widget.dart';
import '../widget/text_field_search_homepage_widget.dart';
import '../widget/top_doctors_widgets/list_view_of_top_doctors_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBarUI(),
      appBar: AppBarWidget(
        title: Utils.home,
        icon: Icons.shopping_cart_rounded,
      ),
      backgroundColor: ColorManager.likeWhiteBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            //main components of app
            ListViewMainComponents(),
            //image of advertisment advertisement
            AdvertismentsOfApp(
              titleAdvertisment: Utils.orderQuickly,
              image: AssetsValuesManager.medicineOfAdvertisment,
              buttonText: Utils.viewCategory,
            ),
            //creating list view of popular on sale
            PopularProductsSection(), //creating list view of products on sale
            SizedBox(height: HeightManager.h20),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: HorizontalPaddingManager.p20,
              ),
              child: TextTitleOfCategories(title: Utils.productOnSale),
            ),
            SizedBox(height: HeightManager.h15),
            ListViewOfProductsOnSaleWidget(),
            //image of advertisment doctors
            SizedBox(height: HeightManager.h15),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: HorizontalPaddingManager.p20,
              ),
              child: TextTitleOfCategories(
                title: Utils.doctors,
                onTapSeeAll: () => AppNavigation.pushNamed(context, RoutesName.topDoctor),
              ),
            ),
            SizedBox(height: HeightManager.h15),
            AdvertismentsOfApp(
              titleAdvertisment: Utils.earlyProtection,
              image: AssetsValuesManager.doctorOfAdvertisment,
              buttonText: Utils.learnMore,
            ),
            SizedBox(height: HeightManager.h15),
            //start at making doctor's place at page
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: HorizontalPaddingManager.p20,
              ),
              child: TextTitleOfCategories(
                title: Utils.topDoctors,
                onTapSeeAll: () => AppNavigation.pushNamed(context, RoutesName.topDoctor),
              ),
            ),
            SizedBox(height: HeightManager.h15),
            ListViewOfTopDoctorsWidget(),
            ////////////////////////////////////
          ],
        ),
      ),
    );
  }
}

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: HeightManager.h10),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: HorizontalPaddingManager.p20,
          ),
          child: TextTitleOfCategories(title: Utils.popularProduct),
        ),
        SizedBox(height: HeightManager.h15),
        ListViewOfPopularMedicineWidget(),
      ],
    );
  }
}

class YourDoctorSection extends StatelessWidget {
  const YourDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: HeightManager.h15),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: HorizontalPaddingManager.p20,
          ),
          child: TextTitleOfCategories(title: Utils.yourRecentDoctors),
        ),
        SizedBox(height: HeightManager.h15),
        ListViewOfRecentDoctorsWidget(),
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: HorizontalPaddingManager.p20,
      ),
      child: Column(
        children: [
          SizedBox(height: HeightManager.h20),
          TextFieldSearchHomePage(),
          SizedBox(height: HeightManager.h20),
        ],
      ),
    );
  }
}
