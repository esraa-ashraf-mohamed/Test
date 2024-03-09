import 'package:flutter/material.dart';
import 'package:test/ui_2/assets_app.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff363F72),
          unselectedItemColor: const Color(0xff667085),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '*',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssetsUI2.icon1)),
              label: '*',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssetsUI2.icon2)),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Image.asset(AppAssetsUI2.imageLogo, scale: 1.3),
                title: RichText(
                      text: const TextSpan(
                        text: 'Hello, Jade',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,),
                          children: <TextSpan>[
                            TextSpan(text: '\nReady to workout?',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,)
                      ),
                    ]),
                ),
                trailing:   badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 10, end: 10),
                  badgeAnimation: const badges.BadgeAnimation.scale(),
                  badgeContent: const CircleAvatar(backgroundColor: Colors.red, radius: 0.5),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none_rounded, size: 30),
                    onPressed: (){},
                  ),
                ),
              ),
              const SizedBox(height: 20,),
             Container(
               padding: const EdgeInsets.all(10),
               decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Color(0xffF8F9FC)
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   bloc(
                       icon: Icons.favorite_border,
                       title: 'Heart Rate',
                       content: '81 BPM'
                   ),
                   Container(
                     height: 60,
                     width: 1,
                     color: const Color(0xffD9D9D9),
                   ),
                   bloc(
                       icon: Icons.list,
                       title: 'To-do',
                       content: '32,5%'
                   ),
                   Container(
                     height: 60,
                     width: 1,
                     color: const Color(0xffD9D9D9),
                   ),
                   bloc(
                       icon: Icons.local_fire_department_outlined,
                       title: 'Calo',
                       content: '1000 Cal'
                   ),
               ],),
             ),
              const SizedBox(height: 20,),
              const Text(
                'Workout Programs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                     Container(
                      constraints: const BoxConstraints.expand(height: 50),
                      child: const TabBar(
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        labelColor: Color(0xff363F72),
                          dividerColor: Color(0xff363F72),
                          indicatorColor: Color(0xff667085),
                          unselectedLabelColor: Color(0xff667085),
                          tabs: [
                        Tab(text: "All Type"),
                        Tab(text: "Full Body"),
                        Tab(text: "Upper"),
                        Tab(text: "Lower"),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
             Expanded(
               child: ListView.separated(
                 separatorBuilder: (context, index) =>
                 const SizedBox(height: 30,),
                 itemCount: 3,
                 itemBuilder: (context, index) => Column(children:[
                   program(
                       path: AppAssetsUI2.imageYoga,
                       text: 'Improve mental focus.',
                       title: 'Morning Yoga',
                       number: '7'),
                   const SizedBox(height: 30,),
                   program(
                       path: AppAssetsUI2.imagePlank,
                       text: 'Improve posture and stability',
                       title: 'Plank Exercise',
                       number: '3')
                 ],),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

  bloc({required IconData icon,
    required String title,
    required String content}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xff717BBC),),
            Text(title, style: const TextStyle(
              fontSize: 18,
            ),)
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(content, style: const TextStyle(
        fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        )
      ],
    );
  }

  program({required String path,
    required String text,
    required String title,
    required String number}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xffEAECF5),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color(0xffF8F9FC),
                ),
                child: Center(
                  child: Text(
                    '$number days',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 22,
                        fontWeight: FontWeight.w500
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '\n$text',
                          style: const TextStyle(
                            fontSize: 12,)
                      ),
                    ]),
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Color(0xff101828),),
                  SizedBox(width: 10,),
                  Text('30 mins', style: TextStyle(
                    fontSize: 18
                  ),)
                ],
              )
            ],
          ),
          Image.asset(path)
        ],
      ),
    );
  }
}
