import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_buttons.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _gottenStars = 4;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            //we have to give it width and height or else stack will give an error
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/mountain.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // SnackBar(
                        //   content: const Text('You pressed the NavBar button'),
                        // );
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  //since we dk each device sizes, we cant give a hard value to width
                  // this is why we use media query
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppLargeText(text: 'Yosemite', color: Colors.black87),
                          AppLargeText(
                              text: '\$ 250', color: AppColors.mainColor),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: 'USA, California',
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < _gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor1,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: '(4.0)',
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'People',
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButtons(
                                      size: 60,
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: _selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: _selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text:
                            'Yosemite National Park is located in the central Sieraa Navada in the US state of California. It is located near the wild protected areas',
                        color: AppColors.mainTextColor,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          isIcon: true,
                          icon: Icons.favorite_border_rounded,
                          size: 60,
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                      
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
