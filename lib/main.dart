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
