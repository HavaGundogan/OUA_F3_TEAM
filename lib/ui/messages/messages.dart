import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yourself_in_time_project/common/widgets/dashboard/test.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120,
              padding: EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Posts",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 280,
                    padding: EdgeInsets.only(top: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeStory(
                          storyImage: 'assets/images/1.png',
                          userImage: 'assets/images/user1.png',
                          userName: 'Ahmet Hamit',
                        ),
                        makeStory(
                          storyImage: 'assets/images/2.png',
                          userImage: 'assets/images/user2.png',
                          userName: 'Burak Seven',
                        ),
                        makeStory(
                          storyImage: 'assets/images/3.png',
                          userImage: 'assets/images/user3.png',
                          userName: 'Mustafa Aydın',
                        ),
                        makeStory(
                          storyImage: 'assets/images/4.png',
                          userImage: 'assets/images/user4.png',
                          userName: 'Melehat Uslu',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  makeFeed(
                    userName: 'Ahmet Hamit',
                    userImage: 'assets/images/user1.png',
                    feedTime: '1 hrs ago',
                    feedText:
                        'Bu programla 10 günlük seriye ulaştım.Yorumlarınızla beni destekleyin 😊',
                    taskName: 'Matematik',
                    category: 'sayısal',
                    startDate: '05.07.2023',
                    endDate: '22.08.2023',
                    seriesDays: 10,
                    context: context,
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[380]),
                  makeFeed(
                    userName: 'Burak Seven',
                    userImage: 'assets/images/user2.png',
                    feedTime: '4 hrs ago',
                    feedText:
                        'Uzun zamandır motive olanıyordum. Harikasın Time catch. Seninle 10 günlük seriye ulaştım🥳',
                    taskName: 'Angular',
                    category: 'Frontend',
                    startDate: '05.03.2023',
                    endDate: '15.08.2023',
                    seriesDays: 10,
                    context: context,
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[380]),
                  makeFeed(
                    userName: 'Mustafa Aydın',
                    userImage: 'assets/images/user3.png',
                    feedTime: '2 days ago',
                    feedText: 'Bir game developer kolay yetişmiyor❤️',
                    taskName: 'C# unity',
                    category: 'Game developer',
                    startDate: '01.01.2023',
                    endDate: '22.08.2023',
                    seriesDays: 100,
                    context: context,
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[380]),
                  makeFeed(
                    userName: 'Melehat Uslu',
                    userImage: 'assets/images/user4.png',
                    feedTime: '1 week ago',
                    feedText:
                        'Verinin içinde kaybolmak istiyorum. Hadi beni kutlayın kodcularr.🥂',
                    taskName: 'Python',
                    category: 'Big Data',
                    startDate: '02.04.2023',
                    endDate: '22.08.2023',
                    seriesDays: 15,
                    context: context,
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[380]),
                  makeFeed(
                    userName: 'Ahmet Hamit',
                    userImage: 'assets/images/user1.png',
                    feedTime: '7 days ago',
                    feedText:
                        'Yeni bir dil , yeni arkadaşlar. Time catch ile gün sayıyoruz🤑',
                    taskName: 'English',
                    category: 'Language',
                    startDate: '07.07.2023',
                    endDate: '22.08.2023',
                    seriesDays: 33,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeStory(
      {required String storyImage,
      required String userImage,
      required String userName}) {
    return AspectRatio(
      aspectRatio: 1.4 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(storyImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(userImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 21),
                height: 40,
                child: Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeFeed({
    required String userName,
    required String userImage,
    required String feedTime,
    required String feedText,
    required String taskName,
    required String category,
    required String startDate,
    required String endDate,
    required int seriesDays,
    required BuildContext context,
  }) {
    List<Color> colors = [
      Color.fromARGB(255, 235, 196, 209),
      Color.fromARGB(255, 168, 192, 230),
      Color.fromARGB(255, 169, 231, 187),
      Color.fromARGB(255, 240, 240, 152),
    ];
    List<Color> colors2 = [
      //içerideki kartın renkleri
      Color.fromARGB(87, 206, 54, 244),
      Colors.orange,
      Colors.pink.shade100,
      Colors.amber,
    ];
    Random random = Random();
    Color backgroundColor = colors[random.nextInt(colors.length)];
    Color backgroundColor2 = colors2[random.nextInt(colors.length)];

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(userImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    feedTime,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            feedText,
            style: TextStyle(
              color: Colors.grey[800],
              height: 1.4,
              fontSize: 14,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  taskName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Category: $category",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Start Date: $startDate",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "End Date: $endDate",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Series Days: $seriesDays",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              makeLikeButton(),
              SizedBox(width: 10),
              makeCommentButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget makeLikeButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.only(left: 7, top: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 10),
          Text('Like'),
        ],
      ),
    );
  }

  Widget makeCommentButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TestMe()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        margin: EdgeInsets.only(left: 7, top: 13),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.comment, color: Colors.blue),
            SizedBox(width: 10),
            Text('Comment'),
          ],
        ),
      ),
    );
  }
}
