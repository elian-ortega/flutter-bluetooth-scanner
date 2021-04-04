part of 'scanner_provider.dart';

/// Defines all the Scanner logic the app will use
class ScannerNotifier extends StateNotifier<ScannerState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  ScannerNotifier({
    required this.flutterBlue,
    ScannerState? initialState,
  }) : super(initialState ?? const ScannerState.initial());

  final FlutterBlue flutterBlue;

  Future<void> scan() async {
    state = const ScannerState.loading();
    await flutterBlue.startScan(timeout: const Duration(seconds: 5));
    state = const ScannerState.initial();
  }

  Future<void> stopScan() async {
    await flutterBlue.stopScan();
  }
}
