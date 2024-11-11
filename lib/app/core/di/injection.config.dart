// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:basic/app/bluetooth/services/bluetooth_service.dart' as _i635;
import 'package:basic/app/core/network/dio_client.dart' as _i51;
import 'package:basic/app/escale/repos/customer_repo.dart' as _i535;
import 'package:basic/app/escale/repos/item_repo.dart' as _i679;
import 'package:basic/app/escale/repos/transaction_repo.dart' as _i50;
import 'package:basic/app/escale/repos/truck_repo.dart' as _i38;
import 'package:basic/app/escale/services/customer_service.dart' as _i823;
import 'package:basic/app/escale/services/item_service.dart' as _i371;
import 'package:basic/app/escale/services/transaction_service.dart' as _i850;
import 'package:basic/app/escale/services/truck_service.dart' as _i919;
import 'package:basic/app/usb_serial/usb_serial_service.dart' as _i311;
import 'package:basic/app/user_accounts/repos/user_accounts_repo.dart' as _i740;
import 'package:basic/app/user_accounts/services/user_account_service.dart'
    as _i200;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i635.BluetoothService>(() => _i635.BluetoothService());
    gh.singleton<_i51.ADioClient>(() => _i51.ADioClient());
    gh.singleton<_i535.CustomerRepo>(() => _i535.CustomerRepo());
    gh.singleton<_i679.ItemRepo>(() => _i679.ItemRepo());
    gh.singleton<_i50.TransactionRepo>(() => _i50.TransactionRepo());
    gh.singleton<_i38.TruckRepo>(() => _i38.TruckRepo());
    gh.singleton<_i823.CustomerService>(() => _i823.CustomerService());
    gh.singleton<_i371.ItemService>(() => _i371.ItemService());
    gh.singleton<_i850.TransactionService>(() => _i850.TransactionService());
    gh.singleton<_i919.TruckService>(() => _i919.TruckService());
    gh.singleton<_i311.UsbSerialService>(() => _i311.UsbSerialService());
    gh.singleton<_i740.UserAccountRepo>(() => _i740.UserAccountRepo());
    gh.singleton<_i200.UserAccountService>(() => _i200.UserAccountService());
    return this;
  }
}
