import '../../usb_serial/usb_serial_service.dart';
import '../di/injection.dart';

final usbSerialService = getIt<UsbSerialService>();

Future<void> connectUsbSerial() async {
  await usbSerialService.connect();
}

Future<void> disconnectUsbSerial() async {
  await usbSerialService.disconnect();
}

