import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class LoaderStyle {
  static Color bg = Colors.black54.withOpacity(0.1);
  static Color loaderColor = Colors.orange.shade300;
}

class CustomLoading extends StatelessWidget {
  CustomLoading({Key? key, this.type = 0}) : super(key: key);
  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: LoaderStyle.loaderColor,
        size: 15.w,
      ),
    );
  }
}

class CSLoading {
  static Future<void> start() async {
    SmartDialog.showLoading(
      maskColor: LoaderStyle.bg,
      animationType: SmartAnimationType.fade,
      builder: (_) => CustomLoading(),
    );
  }

  static Future<void> dismiss() async {
    return SmartDialog.dismiss();
  }
}

class CSLoadingWidget extends StatelessWidget {
  const CSLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoading();
  }
}
