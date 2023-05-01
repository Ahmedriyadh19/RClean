// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  final String path;
  const MyScreen({
    Key? key,
    required this.path,
  }) : super(key: key);
  @override
  State<MyScreen> createState() => MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  double soundVal = 10;
  Timer? timer;
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 0, bottom: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(isPlay ? Icons.stop_rounded : Icons.play_arrow_rounded),
                onPressed: () async {
                  setState(() {
                    isPlay = !isPlay;
                  });
                },
              ),
              const Text('Volume'),
              const SizedBox(height: 5),
              Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.add),
                    onTap: () async {
                      setState(() {
                        soundVal++;
                      });
                    },
                    onLongPress: () => setState(() {
                      timer = Timer.periodic(const Duration(milliseconds: 120), (timer) async {
                        if (soundVal <= 100) {
                          setState(() {
                            soundVal++;
                          });
                        }
                      });
                    }),
                    onLongPressEnd: (_) => setState(() {
                      timer?.cancel();
                    }),
                  ),
                  Text('$soundVal'),
                  GestureDetector(
                    child: const Icon(Icons.remove),
                    onTap: () async {
                      setState(() {
                        soundVal--;
                      });
                    },
                    onLongPress: () => setState(() {
                      timer = Timer.periodic(const Duration(milliseconds: 150), (timer) async {
                        if (soundVal >= 0) {
                          setState(() {
                            soundVal--;
                          });
                        }
                      });
                    }),
                    onLongPressEnd: (_) => setState(() {
                      timer?.cancel();
                    }),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
