
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import 'list_quote_viewmodel.dart';

class QuoteItem extends StatefulWidget {
  const QuoteItem({Key? key}) : super(key: key);

  @override
  State<QuoteItem> createState() => _QuoteItemState();
}

class _QuoteItemState extends State<QuoteItem> {
  late FlutterTts flutterTts;
  double volume = 1;
  double pitch = 1.0;
  double rate = 1;
  late ListQuoteViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();
    _setAwaitOptions();

    // if (!kIsWeb && Platform.isAndroid) {
    //   _getDefaultEngine();
    //   _getDefaultVoice();
    // }

    // if (!kIsWeb && Platform.isAndroid) {
    //   flutterTts.setInitHandler(() {
    //     setState(() {
    //       print("TTS Initialized");
    //     });
    //   });
    // }
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ListQuoteViewModel>(context, listen: true);

    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            "${viewModel.quotes?[0].quote}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "- ${viewModel.quotes?[0].author} - ",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 18
                  )
              ),
              IconButton(
                onPressed: () async {
                  await flutterTts.setVolume(volume);
                  await flutterTts.setSpeechRate(rate);
                  await flutterTts.setPitch(pitch);

                  await flutterTts.speak("Great ambition is the passion of a great character. Those endowed with it may perform very good or very bad acts. All depends on the principals which direct them.");

                },
                icon: Icon(Icons.volume_up, color: Colors.white, size: 24,)
              )
            ],
          ),

        ],
      ),
    );
  }
}