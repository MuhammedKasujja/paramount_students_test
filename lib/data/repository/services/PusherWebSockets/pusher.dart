import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'dart:developer';

class PusherService {
  static const host = "crm-demo.paramountstudents.com";
  static const appKey = "localapp";


  /// Init Pusher Listener
  LaravelFlutterPusher initPusher(String token) {
    return LaravelFlutterPusher(
        appKey,
        PusherOptions(
            host: host,
            port: 6001,
            encrypted: false,
            cluster: "mt1",
            auth: PusherAuth('http://$host/api/broadcasting/auth', headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "application/json"
            })),
        enableLogging: true, onError: (error) {
      log('error: ${error.message}, code: ${error.code}, exception: ${error.exception}');
    }, onConnectionStateChange: (status) {
      log('current state: ${status.currentState}');
    });
  }
}
