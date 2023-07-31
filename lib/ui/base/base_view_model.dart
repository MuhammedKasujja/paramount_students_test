import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  /// Abstract methods to be overriden
  void init();
  void close();
}
