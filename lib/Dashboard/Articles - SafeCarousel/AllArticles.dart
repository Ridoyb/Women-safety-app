import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:women_safety/utils/constants.dart';

import '../../articles-carousel/ArticleDesc.dart';
import '../../articles-carousel/SafeWebView.dart';

class AllArticles extends StatefulWidget {
  AllArticles({Key? key}) : super(key: key);

  @override
  _AllArticlesState createState() => _AllArticlesState();
}

class _AllArticlesState extends State<AllArticles>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bg-top.png',
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              color: Colors.grey[50]!.withOpacity(0.3),
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 188.0,
                  backgroundColor: Colors.grey[50]!.withOpacity(0.3),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Lottie.asset(
                      "assets/reading.json",
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller!
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      imageSliders.length,
                      (index) => Hero(
                        tag: articleTitle[index],
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 180,
                            child: InkWell(
                              onTap: () {
                                // WebviewScaffold(
                                //   url: "https://www.google.com",
                                //   appBar: new AppBar(
                                //     title: new Text("Widget webview"),
                                //   ),
                                // ),
                                if (index == 0) {
                                  navigateToRoute(
                                      context,
                                      SafeWebView(
                                          index: index,
                                          title:
                                              "Bangladeshi women inspiring the country",
                                          url:
                                              "https://www.tbsnews.net/women-empowerment/inspiring-bangladeshi-women-recent-times-whom-you-need-know-254668"));
                                } else if (index == 1) {
                                  navigateToRoute(
                                      context,
                                      SafeWebView(
                                          index: index,
                                          title: "We have to end Violance",
                                          url:
                                              "https://www.unwomen.org/en/what-we-do/ending-violence-against-women"));
                                }  else if (index == 2) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  index: index,
                                  title: "Be a change",
                                  url:
                                      "https://careclimatechange.org/women-as-agents-of-change-in-bangladesh/"));
                        }  else {
                                  navigateToRoute(
                                      context,
                                      SafeWebView(
                                          index: index,
                                          title: "You are strong",
                                          url:
                                              "https://www.thedailystar.net/views/opinion/news/the-strong-women-tea-gardens-2926126"));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(imageSliders[index]),
                                      fit: BoxFit.cover),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.5),
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 8),
                                      child: Text(
                                        articleTitle[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void navigateToRoute(
    BuildContext context,
    Widget route,
  ) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => route,
      ),
    );
  }
}
