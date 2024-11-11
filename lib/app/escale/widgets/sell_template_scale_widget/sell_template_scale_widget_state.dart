part of 'sell_template_scale_widget_cubit.dart';

@freezed
class SellTemplateScaleWidgetState with _$SellTemplateScaleWidgetState {
  const factory SellTemplateScaleWidgetState.initial({
    String? status,
    required String weight,
    required UsbDevice? device,
  }) = _Initial;
}
