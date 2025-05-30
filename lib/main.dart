import 'package:flutter/material.dart';

void main() {
  runApp(AndroidSettingsCloneApp());
}

class AndroidSettingsCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Settings Clone',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      home: SettingsHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SettingsHome extends StatefulWidget {
  @override
  _SettingsHomeState createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> {
  bool wifiEnabled = true;
  bool bluetoothEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Wi-Fi'),
            subtitle: Text(wifiEnabled ? 'Connected' : 'Off'),
            trailing: Switch(
              value: wifiEnabled,
              onChanged: (value) {
                setState(() => wifiEnabled = value);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WifiSettings()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bluetooth),
            title: Text('Bluetooth'),
            subtitle: Text(bluetoothEnabled ? 'On' : 'Off'),
            trailing: Switch(
              value: bluetoothEnabled,
              onChanged: (value) {
                setState(() => bluetoothEnabled = value);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BluetoothSettings()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.display_settings),
            subtitle: Text("Dark Theme,Font Size,Brightness"),
            title: Text('Display'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DisplaySettings()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Sound & Vibration'),
            subtitle: Text(
              "Customize what is displayed on Home and lock screens",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SoundSettings()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
            subtitle: Text("Notification History,Conversations"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.gesture),
            title: Text('Gestures'),
            subtitle: Text(
              "Use gestures and keys to quickly open frequently used functions",
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.battery_2_bar_sharp),
            title: Text('Battery'),
            subtitle: Text("54% - Untill 6:15 am"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Storage'),
            subtitle: Text("22% used - 99.49 GB free"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_pin),
            title: Text('Location'),
            subtitle: Text("On - 17 apps have access to location"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Accessibility'),
            subtitle: Text("Display,interaction,audio"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('Apps'),
            subtitle: Text("Recent apps, default apps"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Passwords,passkeys & accounts'),
            subtitle: Text("Suggestions for sign-in & auto-fill"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Security & privacy'),
            subtitle: Text("App security, device lock, permission"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Saftey & emergency'),
            subtitle: Text("Emergency SOS, medical info, alerts"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text('Digital Wellbeing and parental controls'),
            subtitle: Text("Screen Time,App Timers,bedtime schedules"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('System Updates'),
            subtitle: Text("Update to the latest software"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.feed),
            title: Text('Rating & Feedback'),
            subtitle: Text("Send suggestions and rate your device"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help'),
            subtitle: Text("Use your phone to fix any issues"),
            onTap: () {},
          ),
         ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('Accessibility'),
            subtitle: Text("Languages,time,backup"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('About Phone'),
            subtitle: Text("Flutter Phone"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutPhoneScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
} 
// Dummy detail screens

class WifiSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wi-Fi')),
      body: Center(child: Text('Wi-Fi settings screen')),
    );
  }
}

class BluetoothSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth')),
      body: Center(child: Text('Bluetooth settings screen')),
    );
  }
}

class DisplaySettings extends StatefulWidget {
  @override
  _DisplaySettingsState createState() => _DisplaySettingsState();
}

class _DisplaySettingsState extends State<DisplaySettings> {
  double brightness = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display')),
      body: Column(
        children: [
          ListTile(
            title: Text('Brightness'),
            subtitle: Slider(
              value: brightness,
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(brightness * 100).toInt()}%',
              onChanged: (value) {
                setState(() => brightness = value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SoundSettings extends StatefulWidget {
  @override
  _SoundSettingsState createState() => _SoundSettingsState();
}

class _SoundSettingsState extends State<SoundSettings> {
  double volume = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sound')),
      body: Column(
        children: [
          ListTile(
            title: Text('Media Volume'),
            subtitle: Slider(
              value: volume,
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(volume * 100).toInt()}%',
              onChanged: (value) {
                setState(() => volume = value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AboutPhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Phone')),
      body: ListView(
        children: [
          ListTile(title: Text('Device Name'), subtitle: Text('Flutter Phone')),
          ListTile(title: Text('Android Version'), subtitle: Text('12.0')),
          ListTile(title: Text('Model Number'), subtitle: Text('FP-2025')),
        ],
      ),
    );
  }
}
