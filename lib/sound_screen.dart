import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundScreen extends StatefulWidget {
  final String? currentPathImage;
  final String? currentNameSound;
  final String? currentPathSound;
  const SoundScreen({
    super.key,
    required this.currentPathImage,
    required this.currentNameSound,
    required this.currentPathSound,
  });
  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  final player = AudioPlayer();
  Duration positionSlider = const Duration();
  Duration totalTimeSound = const Duration();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    getSource();

    player.onDurationChanged.listen((Duration d) {
      setState(() => totalTimeSound = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => positionSlider = p);
    });

    // خاصية التكرار عند انتهاء التشغيل
    // player.onPlayerComplete.listen((event) async {
    //   await player.seek(Duration.zero); // العودة للبداية
    //   await player.play(AssetSource("sounds/111.mp3")); // التشغيل التلقائي
    // });
  }

  void getSource() async {
    await player.setSource(AssetSource("${widget.currentPathSound}"));
  }

  // دالة لتنسيق الوقت
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffFFE386)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFFC90F), Color(0xffFFE386)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("${widget.currentPathImage}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "${widget.currentNameSound}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            // المؤشر الزمني
            Slider(
              activeColor: Colors.blue,
              value: positionSlider.inSeconds.toDouble(),
              max: totalTimeSound.inSeconds.toDouble() > 0
                  ? totalTimeSound.inSeconds.toDouble()
                  : 1,
              onChanged: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
              },
            ),

            // عرض الوقت
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(positionSlider)),
                Text(formatTime(totalTimeSound)),
              ],
            ),

            // أزرار التحكم
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: () async {
                    final newPosition =
                        positionSlider - const Duration(seconds: 10);
                    await player.seek(newPosition >= Duration.zero
                        ? newPosition
                        : Duration.zero);
                  },
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.white,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    setState(() => isPlaying = !isPlaying);

                    if (isPlaying) {
                      await player
                          .play(AssetSource("${widget.currentPathSound}"));
                    } else {
                      await player.pause();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: () async {
                    final newPosition =
                        positionSlider + const Duration(seconds: 10);
                    if (newPosition < totalTimeSound) {
                      await player.seek(newPosition);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
