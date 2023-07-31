import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

Future<void> showTextFieldInfo({
  required BuildContext context,
  required Size parentWidgetSize,
  required int noOfRowTextFieldWidgets,
  required int currentRowTextFieldWidgetIndex,
  required String data,
  required String dataTitle,
  bool isItForEduMajor = false,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      double top = (parentWidgetSize.height / noOfRowTextFieldWidgets) *
          (currentRowTextFieldWidgetIndex);
      debugPrint('this is the height of this widget $top');
      return Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          height: isItForEduMajor == true ? 180.0 : 150.0,
          margin: EdgeInsets.only(top: top),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        dataTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    data,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
