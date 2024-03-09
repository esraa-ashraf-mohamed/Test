import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/ui_1/assets_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppAssets.logo, scale: 1.3),
        actions:[
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            badgeAnimation: const badges.BadgeAnimation.scale(),
            badgeContent: const CircleAvatar(backgroundColor: Colors.red, radius: 0.5),
              child: IconButton(
                  icon: const Icon(Icons.notifications_none_rounded, size: 30),
                onPressed: (){},
              ),

          )
        ],
        title: const Text(
          'Moody',
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff027A48),
        unselectedItemColor: const Color(0xff667085),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icon)),
            label: '*',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '*',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '*',
          )
        ],
        currentIndex: currentIndex,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Hello, ',
                style: TextStyle(
                    color: Color(0xff371B34),
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Sara Rose', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Text(
                'How are you feeling today?',
              style: TextStyle(
                  color: Color(0xff371B34),
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),
            ),
          const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                feelings("Love", AppAssets.love),
                feelings("Cool", AppAssets.cool),
                feelings("Happy", AppAssets.happy),
                feelings("Sad", AppAssets.sad),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    'Feature',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextButton(
                    onPressed: (){},
                    child: const Row(
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(
                          fontSize: 16,
                            color: Color(0xff027A48),
                        ),),
                        Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff027A48),
                            size: 16
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xffECFDF3),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Positive vibes \nBoost your mood with \nPositive vibes',
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xff32D583),
                            child: Icon(
                                Icons.play_arrow,
                                size: 15,
                                color: Colors.white),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '10 mins',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Image.asset(AppAssets.Walking_the_Dog),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Center(
              child: SmoothPageIndicator(
                controller: PageController(),
                  count:  3,
                  effect:  const WormEffect(
                      strokeWidth: 1.5,
                      type: WormType.thin,
                      dotHeight: 10,
                      dotWidth: 10,
                      radius: 0.3,
                    dotColor:  Color(0xffD9D9D9),
                    activeDotColor: Color(0xff98A2B3)
                  ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Exercise',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
                TextButton(
                    onPressed: (){},
                    child: const Row(
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff027A48),
                          ),),
                        Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff027A48),
                            size: 16
                        ),
                      ],
                    ))
              ],
            ),
            Wrap(
              spacing: 20,
              children: [
                section(
                    path: AppAssets.relaxation,
                    text: 'Relaxation',
                    color: const Color(0xffF9F5FF)
                ),
                section(
                    path: AppAssets.meditation,
                    text: 'Meditation',
                    color: const Color(0xffFDF2FA)
                ),
                section(
                    path: AppAssets.breathing,
                    text: 'Breathing',
                    color: const Color(0xffFFFAF5)
                ),
                section(
                    path: AppAssets.yoga,
                    text: 'Yoga',
                    color: const Color(0xffF0F9FF)
                )

              ],
            )
          ],
        ),
      ),
    );
  }

  feelings(String text, String path){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: Image.asset(path),
        ),
        const SizedBox(height: 7,),
        Text(text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }

  section({required String path, required String text, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      height: 40,
      width: 150,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child:Row(
        children: [
          Image.asset(path,),
          const SizedBox(width: 8,),
          Text(text, style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),),
        ],
      )
    );
  }
}
