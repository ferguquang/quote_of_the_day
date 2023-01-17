import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  TextToSpeechService._();

  static final instance = TextToSpeechService._();

  FlutterTts flutterTts = FlutterTts();

  Future<void> initTTSService() async {
    flutterTts = FlutterTts();
    // await flutterTts.setSharedInstance(true);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.ambient,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers
        ],
        IosTextToSpeechAudioMode.voicePrompt
    );

    await flutterTts.awaitSpeakCompletion(true);

    await flutterTts.awaitSynthCompletion(true);

    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(1.0);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);

    await flutterTts.isLanguageAvailable("en-US");
  }

  void speak(String text) {
    flutterTts.speak(text);
  }
}