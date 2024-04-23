import 'package:flutter/material.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   CleverTapPlugin.init("TEST-65W-KK5-9W7Z", "", "");
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Button App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Custom method to set the user's location
  void setUserLocation() {
    CleverTapPlugin.enableDeviceNetworkInfoReporting(true);
    var lat = 19.07; // Latitude of the location
    var long = 72.87; // Longitude of the location
    CleverTapPlugin.setLocation(lat, long);
    print('Location set to Latitude: $lat, Longitude: $long');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Button App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, World!',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20), // Add some space between text and button
            ElevatedButton(
              onPressed: () {
                // This is the action that is performed when the button is pressed.
                var stuff = ["bags", "shoes","shirts","mobiles"];
                var profile = {
                    'Name': 'Arya Singh',
                    'Identity': '102',
                    'Email': 'arya@gmail.com',
                    'Phone': '+917283917648',
                    'Gender': 'F',
                    'Hobbies':'Dancing',
                    'dob': CleverTapPlugin.getCleverTapDate(DateTime.parse("19770523")),
                    'stuff': stuff
                };
                CleverTapPlugin.onUserLogin(profile);
                print('Button Pressed!');
              },
              child: const Text('Sample user profile'),
            ),
            const SizedBox(height: 20), // Add some space between text and button
            ElevatedButton(
              onPressed: () {
                // This is the action that is performed when the button is pressed.
                /*var eventData = {
                    // Key:    Value
                  'SeriesName': 'Vampire Diaries',
                  'Duration': '42',
                  'Actor' : 'Ian,Nina & Paul',
                  'Genre' : 'Thriller'
                };
                CleverTapPlugin.recordEvent("Flutter Event Pushed", eventData);*/
                var now = new DateTime.now();
   /* var eventData = {
      // Key:    Value
      'first': 'partridge',
      'second': 'turtledoves',
      'date': CleverTapPlugin.getCleverTapDate(now),
      'number': 1
    };*/
    CleverTapPlugin.recordEvent("Flutter Event", {
      // Key:    Value
      'first': 'partridge 1',
      'second': 'turtledoves',
      'date': CleverTapPlugin.getCleverTapDate(now),
      'number': 2
    });
                print('Event Button Pressed!');
              },
              child: const Text('Event push'),
            ),
            const SizedBox(height: 20), // Add some space between text and button
            ElevatedButton(
              onPressed: () {
                var item1 = {
                    // Key:    Value
                    'name': 'shoes',
                    'amount': '100'
                };
                var item2 = {
                  // Key:    Value
                  'name': 'Tops',
                  'amount': '500'
                };
                var items = [item1, item2];
                var chargeDetails = {
                    // Key:    Value
                    'total': '500',
                    'payment': 'cash'
                };
                CleverTapPlugin.recordChargedEvent(chargeDetails, items);
                print('Charged Event Button Pressed!');
              },
              child: const Text('Charged Event push'),
            ),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the custom method when the button is pressed
                setUserLocation();
              },
              child: const Text('Set User Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var pushData = {
                  'titleText': 'Would you like to receive Push Notifications?',
                  'bodyText':'We promise to only send you relevant content and give you updates on your transactions',
                  'okButtonText': 'Ok',
                  'rejectButtonText': 'Cancel',
                  'okButtonColor': '#F28046',
                  'askAgainTimeInSeconds': 5,
                  'serviceWorkerPath': './flutterclevertap_sw.js'
                };
                CleverTapPlugin.enableWebPush(pushData);
                CleverTapPlugin.recordEvent("Flutter Push Event Pushed",{});
              },
              child: const Text('Clevertap web push'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CleverTapPlugin.recordEvent("Flutter Web Popup Event Pushed",{});
                print('Inapp Button Pressed!');
              },
              child: const Text('Flutter inapp'),
            ),
              ],
            ),
      ),
    );
  }

  
}


