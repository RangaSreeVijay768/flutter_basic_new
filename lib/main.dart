import 'package:basic/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import 'app/authentication/authentication_cubit.dart';
import 'app/bluetooth/state/bluetooth_cubit.dart';
import 'app/core/api_url/api_url.dart';
import 'app/core/blocs/app_bloc_observer.dart';
import 'app/core/di/injection.dart';
import 'app/core/logger/log.dart';
import 'app/core/services/usb_serial.dart';
import 'app/routes/routes.dart';
import 'app/usb_serial/usb_serial_service.dart';

void main() async {
  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // connectUsbSerial();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BluetoothCubit>(
            lazy: false,
            create: (context) {
              logger.d("Building bluetooth cubit");
              return BluetoothCubit(context: context);
            }),
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(context: context),
        ),
      ],
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: FToastBuilder(),
            routerConfig: router,
            theme: Themes.lightTheme,
          );
        },
      ),
    );
  }
}
