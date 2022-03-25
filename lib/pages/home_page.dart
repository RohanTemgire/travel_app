import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //tabbar have their own state management so you can access those states when you have TickerProviderStateMixin class
  // implemented in your class bc tabbar needs vsync.
  Map _images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    // we have to write it here cause vsync requires a context to rebuild so it takes the context  of this widget
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu_rounded,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: AppLargeText(
                  text: 'Discover',
                ),
                margin: const EdgeInsets.only(left: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    //for our custom indicator to be built we have to define a class which extends decoration.
                    //bc it requires a decoration widget we create one
                    tabs: [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions'),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage('img/mountain.jpeg'),
                                fit: BoxFit.cover),
                          ),
                        );
                      }),
                  const Text('there'),
                  const Text('bye'),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: 'Explore more',
                      size: 22,
                    ),
                    AppText(
                      text: 'See all',
                      color: AppColors.textColor1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              // margin: const EdgeInsets.only(right: 50),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('img/'+_images.keys.elementAt(index)),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              child: AppText(
                                text: _images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  //once we create a decoration widget, it has a method called createBoxPainter which requires a BoxPainter
  //so we create that

  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirlcePainter(color: color, radius: radius);
  }
  //within this we need to return something, orelse it wont work
  //to return a customized circle we need to return another class

}

class _CirlcePainter extends BoxPainter {
  //since createboxpainter return a BoxPainter
  //so we have to create a class which extends a BoxPainter
  final Color color;
  double radius;
  _CirlcePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true; //for hardware accelaration

    // the circle is not coming in the middle so for that
    // we take the configuration(using this we can access where it taps, that area) and then divide it by 2,
    // so that we get it in the middle

    final Offset _circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height -
            radius); // we have to pass the x&y coordinates
    canvas.drawCircle(offset + _circleOffset, radius, _paint);
  }
}
