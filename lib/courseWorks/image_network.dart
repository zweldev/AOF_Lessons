import 'package:flutter/material.dart';

class ImageEXP extends StatelessWidget {
  const ImageEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image EXP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 500,
              height: 500,
              child: Image.network(
                "https://wallpapers.com/images/file/lamborghine-huracan-in-forza-4-n2zp7ktjjr6imn3u.jpg",
                // repeat: ImageRepeat.repeat,
                alignment: Alignment.bottomLeft,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  print(loadingProgress);
                  // return CircularProgressIndicator();
                  if (loadingProgress == null) return child;
                  return CircularProgressIndicator();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
