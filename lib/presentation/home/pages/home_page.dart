import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibrona/common/helper/is_dark_mode.dart';
import 'package:vibrona/common/widgets/appbar/basic_appbar.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/core/config/assets/assets_vectors.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';
import 'package:vibrona/presentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        widget: Center(child: Image.asset(AssetsImages.assetsImagesAppBarLogo)),
        isbackHide: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: TabBarView(
                controller: _tabController,
                children: [
                  NewsSongs(),
                  Center(child: Text('Videos Content')),
                  Center(child: Text('Artists Content')),
                  Center(child: Text('Podcasts Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SvgPicture.asset(AssetsVectors.assetsVectorsHomeTopCard),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Image.asset(AssetsImages.assetsImagesMahmoud),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      indicatorColor: AppColors.primary,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      tabs: [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          'Vidoes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        Text(
          'Podcasts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
