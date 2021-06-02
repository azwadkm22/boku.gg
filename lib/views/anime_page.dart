import 'package:boku_gg/widgets/episode_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatelessWidget {
  AnimePage({
    required this.imageLink,
    required this.id,
    required this.title,
    required this.status,
    required this.genreList,
    required this.totalEpisodes,
    this.summary = "",
  });
  final String imageLink;
  final String id;
  final String title;
  final String status;
  final List genreList;
  // final int releasedEpisodes;
  final int totalEpisodes;
  final String summary;
  final Color textColor = Color(0xFFDEDEDE);
  final Color statusBarColor = Colors.greenAccent;
  final Color statusTextColor = Color(0xFF282828);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF282828),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.white12,
                      // child: Image(
                      //   image: NetworkImage(imageLink),
                      //   fit: BoxFit.fill,
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: imageLink,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      height: 200,
                      width: 160,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Text(
                          "Description: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        summary,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 25,
                        color: statusBarColor,
                        child: Text(
                          "Status: " + status,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: statusTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Total Episodes: " + totalEpisodes.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        padding: const EdgeInsets.all(2),
                        controller: ScrollController(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 2,
                        children: [
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1000),
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1),
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1),
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1),
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1),
                          // EpisodeButton(onPressed: () {}, episodeNumber: 1),
                          ...List.generate(
                              totalEpisodes,
                              (index) => EpisodeButton(
                                    onPressed: () {},
                                    episodeNumber: index + 1,
                                  )),
                        ],
                      )
                    ],
                  ),
                ),
                // Expanded(
                //   child: ,
                // ),
              ]),
        ),
      ),
    );
  }
}