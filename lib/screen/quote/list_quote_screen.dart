import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/base/text_to_speech_service.dart';
import 'package:quote_of_the_day/model/category_list_response.dart';
import 'package:quote_of_the_day/screen/quote/quote_item.dart';

import 'list_quote_viewmodel.dart';

class ListQuoteScreen extends StatefulWidget {
  Categories categories;
  ListQuoteScreen({Key? key, required this.categories}) : super(key: key);

  @override
  State<ListQuoteScreen> createState() => _ListQuoteScreenState();
}

class _ListQuoteScreenState extends State<ListQuoteScreen> {
  ListQuoteViewModel viewModel = ListQuoteViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getListQuote(widget.categories.name ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer(
          builder: (context, ListQuoteViewModel viewModel, _) {
            if (viewModel.quotes?.isEmpty ?? true) {
              return Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${viewModel.quotes?[0].background}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(value: downloadProgress.progress);
                    },
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  AnimationLimiter(
                    child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: const FlipAnimation(
                            child: FadeInAnimation(
                              child: QuoteItem(),
                            ),
                          ),
                        );
                      })
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
