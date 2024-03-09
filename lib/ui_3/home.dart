import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test/ui_3/assets_app.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssetsUI3.logo,),
            const SizedBox(width: 5,),
            const Text(
              'AliceCare',
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 24,
                  fontFamily: 'Milonga',
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff6941C6),
        unselectedItemColor: const Color(0xff475467),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssetsUI3.icon)),
            label: 'Insights',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          )
        ],
        currentIndex: currentIndex,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff667085),
                    size: 30,
                  ),
                  hintText: 'Articles, Video, Audio and More,...',
                  hintStyle: TextStyle(
                    color: Color(0xff667085),
                    fontSize: 18
                  )
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    topic('Discover'),
                    topic('News'),
                    topic('Most Viewed'),
                    topic('Saved')
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hot topics',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: const Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff5925DC),
                            ),),
                          Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff5925DC),
                              size: 16
                          ),
                        ],
                      ))
                ],
              ),
              CarouselSlider(
                  items: [
                    slider(
                        path: AppAssetsUI3.image1,
                        text: '10 Easy Self-Care Ideas That Can \nHelp Boost Your Health',
                        title: 'self-care'),
                    slider(
                        path: AppAssetsUI3.image2,
                        text: 'How to take care of Menstrual \nHygiene during Menstrual Cycle',
                        title: 'cycle')
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 1,
                  )),
              const SizedBox(height: 10,),
              const Text(
                  'Get Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F4F7),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssetsUI3.image3),
                    Column(
                      children: [
                        const Text(
                            'Connect with doctors & \nget suggestions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        const Text(
                            'Connect now and get \nexpert insights',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff7F56D9))
                          ),
                            onPressed: (){},
                            child: const Text(
                                'View details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cycle Phases and Period',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: const Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff5925DC),
                            ),),
                          Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff5925DC),
                              size: 16
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  topic(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
          label: Text(text, style: TextStyle(
            fontSize: 16
          )),
        padding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        backgroundColor:const  Color(0xffF4EBFF),
      ),
    );
  }

  slider({required String path, required String text, required String title}) {
    return Stack(
      children: [
        Image.asset(path),
        Positioned(
            bottom: 90,
            left: 15,
            child: Chip(
                label: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff93370D)
                  ),
                ))),
        Positioned(
          bottom: 40,
          left: 15,
          child: Text(text,
            style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }
}