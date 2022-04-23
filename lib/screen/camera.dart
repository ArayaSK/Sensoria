// @dart=2.9;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'package:sensoria/model/models.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;
  final String model;

  Camera(this.cameras, this.model, this.setRecognitions);
  @override
  _CameraState createState() => new _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller1;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();
    // CameraController controller1;
    print('No camera is found11');
    if (widget.cameras == null || widget.cameras.length < 1) {
      print('No camera is found');
    } else {
      CameraController controller1 = new CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      );
      controller1.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});

        controller1.startImageStream((CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = new DateTime.now().millisecondsSinceEpoch;

            if (widget.model == mobilenet) {
              Tflite.runModelOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                imageHeight: img.height,
                imageWidth: img.width,
                numResults: 2,
              ).then((recognitions) {
                int endTime = new DateTime.now().millisecondsSinceEpoch;
                print("Detection took ${endTime - startTime}");

                widget.setRecognitions(recognitions!, img.height, img.width);

                isDetecting = false;
              });
            }
          }
        });
      });
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller1 == null || !controller1.value.isInitialized) {
      return Container();
    }

    var tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = controller1.value.previewSize!;
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;

    return OverflowBox(
      maxHeight:
          screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
      // screenH,
      maxWidth:
          screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
      // screenW,
      child: CameraPreview(controller1),
    );
  }
}
