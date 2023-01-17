import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/model/category_list_response.dart';

class CategoryItem extends StatelessWidget {
  Categories model;
  CategoryItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: "https://theysaidso.com${model.background}",
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return CircularProgressIndicator(value: downloadProgress.progress);
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            "${model.title}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),

      ],
    );
  }
}
