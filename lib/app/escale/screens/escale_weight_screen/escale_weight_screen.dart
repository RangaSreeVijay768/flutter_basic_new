// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_libserialport/flutter_libserialport.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ScaleConnectionPage extends StatefulWidget {
//   const ScaleConnectionPage({super.key});
//
//   @override
//   State<ScaleConnectionPage> createState() => _ScaleConnectionPageState();
// }
//
// class _ScaleConnectionPageState extends State<ScaleConnectionPage> {
//   String weight = "0.00"; // Default weight value
//   SerialPort? port;
//   SerialPortReader? reader;
//   List<String> ioBuffer = <String>[];
//
//   @override
//   void initState() {
//     super.initState();
//     _connectToScale();
//   }
//
//   void _showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black54,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
//
//   Future<void> _connectToScale() async {
//     // List all available serial ports
//     final availablePorts = SerialPort.availablePorts;
//
//     if (availablePorts.isEmpty) {
//       _showToast("No available serial ports found");
//       return;
//     }
//
//     for (var portName in availablePorts) {
//       try {
//         port = SerialPort(portName);
//         if (port!.openReadWrite()) {
//           // Successfully connected to the port
//           _showToast("Connected to $portName");
//           reader = SerialPortReader(port!, timeout: 10);
//
//           // Listen for incoming data
//           reader!.stream.listen((data) {
//             String stringData = String.fromCharCodes(data).trim(); // Clean up any extra whitespace or newlines
//             if (stringData.contains("Weight:")) {
//               // Extract the weight value (assuming format "Weight: 123.45")
//               setState(() {
//                 weight = stringData.replaceFirst("Weight:", "").trim();
//               });
//             }
//             ioBuffer.add("# $stringData");
//             print("Received: $stringData");
//           });
//
//           break; // Stop once the correct port is found
//         }
//       } catch (e) {
//         _showToast("Error connecting to port $portName");
//         print("Error connecting to port $portName: $e");
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     port?.close();
//     _showToast("Disconnected from device");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Connect to Electronic Scale"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               margin: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.amber[50],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Live Weight",
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "$weight kg", // Display the live weight
//                       style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Display serial data logs
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(10),
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: ioBuffer.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   int reversedIndex = ioBuffer.length - 1 - index;
//                   return Container(
//                     padding: const EdgeInsets.all(8),
//                     child: SelectableText(
//                       ioBuffer[reversedIndex],
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
