import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeThumbnail extends FloatingActionButton {
  AnimeThumbnail({
    Color textColor = Colors.white,
    required String imageLink,
    required id,
    required String title,
    required VoidCallback onPressed,
  }) : super(
            heroTag: null,
            onPressed: onPressed,
            child: SizedBox(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // Image(
                  //   image: NetworkImage(imageLink),
                  //   alignment: Alignment.center,
                  //   height: double.infinity,
                  //   width: double.infinity,
                  //   fit: BoxFit.fill,
                  // ),
                  CachedNetworkImage(
                    imageUrl: imageLink,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ));
}
