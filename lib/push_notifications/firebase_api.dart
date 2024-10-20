import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/main.dart';
import 'package:push_notification/screen/notification_screen.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');

}

class FirebaseApi{
  final _firebaseMessaging=FirebaseMessaging.instance;
void handelMessage(RemoteMessage? message){
  if (message==null) return;
  navigatorKey.currentState?.pushNamed(NotificationScreen.route, arguments: message);
}
Future initPushNotifications() async{
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  _firebaseMessaging.getInitialMessage().then(handelMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final FCMtoken=await _firebaseMessaging.getToken();
    print('Token : $FCMtoken');
     initPushNotifications();
  }
}