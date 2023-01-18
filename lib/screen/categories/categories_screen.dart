import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:quote_of_the_day/base/utils.dart';
import 'package:quote_of_the_day/screen/quote/list_quote_screen.dart';

import 'categories_viewmodel.dart';
import 'category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesViewModel categoriesViewModel = CategoriesViewModel();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: categoriesViewModel,
        child: Consumer(
          builder: (context, CategoriesViewModel viewModel, _) {
            return Column(
              children: [
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: viewModel.categories?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            verticalOffset: 100.0,
                            child: FadeInAnimation(
                              child: InkWell(
                                child: CategoryItem(model: viewModel.categories![index],),
                                onTap: () {
                                  pushPage(context, ListQuoteScreen(
                                    categories: viewModel.categories![index],
                                  ));
                                },
                              ),
                            ),
                          ),
                        );
                      }
                    )
                  ),
                ),
                Visibility(
                  visible: viewModel.erro?.isNotEmpty ?? false,
                  child: Text(viewModel.erro ?? "")
                ),
                // DefaultTextStyle(
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //   ),
                //   child: AnimatedTextKit(
                //     animatedTexts: [
                //       WavyAnimatedText(
                //         viewModel.erro ?? "",
                //         textStyle: TextStyle(color: Colors.amber)
                //       ),
                //     ],
                //     isRepeatingAnimation: true,
                //     onTap: () {
                //       print("Tap Event");
                //     },
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
