
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ArticleChaptersScreen extends StatefulWidget {
  @override
  _ArticleChaptersScreenState createState() => _ArticleChaptersScreenState();
}

class _ArticleChaptersScreenState extends State<ArticleChaptersScreen> {
  late StreamController<List<ArticleChapter>> _controller;
  late Stream<List<ArticleChapter>> _stream;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<List<ArticleChapter>>();
    _stream = _controller.stream;
    fetchArticles();
  }

  void fetchArticles() async {
    // Load default articles
    List<ArticleChapter> defaultArticles = [
      ArticleChapter(
        name: 'Awareness for health and well-being  ',
        imageUrl: 'assets/images/protection.png',
        description: "Here's a description focusing specifically on awareness for women's health and well-being:  Awareness for women's health and well-being encompasses various aspects of physical, mental, and emotional health.It involves educating women about their reproductive health, including menstrual hygiene, contraception, and family planning,Mental health awareness is crucial for addressing issues like depression, anxiety, and postpartum depression.Women should be encouraged to seek help when needed and to prioritize self-care practices that promote mental well-being."
      ),
      ArticleChapter(
        name: 'Awareness of Rights',
        imageUrl: 'assets/images/protection.png',
        description: "Awareness campaigns highlight women's right to live free from all forms of violence and harassment, including domestic violence, sexual assault, and workplace harassment.Women should be educated about available support services, legal remedies, and ways to seek help in case of violence or abuse,Awareness efforts emphasize the principle of gender equality and advocate against discrimination based on gender.Women should be informed about their right to equal opportunities in education, employment, and participation in public life, free from discrimination and prejudice.",
      ),
    ];

    // Fetch articles from Firestore
    List<ArticleChapter> firestoreArticles = await getArticlesFromFirestore();

    // Merge default articles with articles from Firestore
    List<ArticleChapter> articles = [];
    articles.addAll(defaultArticles);
    articles.addAll(firestoreArticles);

    // Add the merged list of articles to the stream
    _controller.add(articles);
  }

  Future<List<ArticleChapter>> getArticlesFromFirestore() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('articles').get();
    List<ArticleChapter> articles = [];
    querySnapshot.docs.forEach((doc) {
      articles.add(ArticleChapter(
        name: doc['name'],
        imageUrl: doc['imageUrl'],
        description: doc['description'],
      ));
    });
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Chapters'),
        backgroundColor: Color(0xFF4C2559),
      ),
      body: StreamBuilder<List<ArticleChapter>>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<List<ArticleChapter>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<ArticleChapter> articles = snapshot.data ?? [];

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              ArticleChapter chapter = articles[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          chapter.name,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                      ),
                      leading: Image.asset(chapter.imageUrl),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDescriptionScreen(chapter: chapter),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void addArticle(String name, String description) {
    // Add the article to Firestore
    FirebaseFirestore.instance.collection('articles').add({
      'name': name,
      'description': description,
      'imageUrl': 'assets/images/protection.png', // Assuming you have a default image for all articles
    });
  }
}

class ArticleDescriptionScreen extends StatelessWidget {
  final ArticleChapter chapter;

  const ArticleDescriptionScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF4C2659),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height *
                  0.05, // Adjust position as needed
              left: 15,
              right: 0,
              child: Text(
                'Discription Articles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 150,width: 150,
                            child: Image.asset("assets/images/protection.png"),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(chapter.name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Color(0xFF4C2559)),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                                  child: Text(chapter.description,
                                    style: TextStyle(color: Color(0xFF4C2559),fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

class ArticleChapter {
  final String name;
  final String imageUrl;
  final String description;

  ArticleChapter({
    required this.name,
    required this.imageUrl,
    required this.description,
  });
}

