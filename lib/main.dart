import 'package:flutter/material.dart';
import 'bluetooth_connection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final BluetoothConnectionManager _bluetoothManager = BluetoothConnectionManager();
  final String chipiBotAddress = "98:DA:60:03:A8:8C"; // LA DIRECCION DEL MODULO HC-06

  @override
  void initState() {
    super.initState();
    _bluetoothManager.checkPermissions();
    _bluetoothManager.connectToDevice(chipiBotAddress);
  }

  @override
  void dispose() {
    _bluetoothManager.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CHIPI-BOT Control")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _bluetoothManager.sendData("0"); // Enviar "0" al CHIPI-BOT
              },
              child: const Text("Enviar 0 grado"),
            ),
            ElevatedButton(
              onPressed: () {
                _bluetoothManager.sendData("180"); // Enviar "180" al CHIPI-BOT
              },
              child: const Text("Enviar 180 grados"),
            ),
          ],
        ),
      ),
    );
  }
}

