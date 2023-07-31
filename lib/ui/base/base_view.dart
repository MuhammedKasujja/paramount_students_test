import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the base view for all UI Views from which every other view extends
/// This structure provides access to a ViewModel and manages state data for each
/// page from their respective Models.
class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext? context, T? model, Widget? child) builder;
  final T? model;
  final Widget? child;
  final Function(T)? onModelReady;
  final Function(T)? onDispose;
  final bool closeKeyboardOnTap;

  const BaseView({
    Key? key,
    required this.builder,
    @required this.model,
    this.child,
    this.onModelReady,
    this.onDispose,
    this.closeKeyboardOnTap = true,
  }) : super(key: key);
  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T? model;

  @override
  void initState() {
    super.initState();
    model = widget.model;

    /// Can call model.init() for values to be initialized in the ViewModel
    if (widget.onModelReady != null) {
      widget.onModelReady!(model!);
    }
  }

  @override
  void dispose() {
    model = widget.model;

    /// Can call model.close() for values to be reverted in the ViewModel
    if (widget.onDispose != null) {
      widget.onDispose!(model!);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model!,
      child: Consumer<T>(
        builder: widget.builder,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: widget.child,
        ),
      ),
    );
  }
}
