// ignore_for_file: no_default_cases

enum ViewState {
  idle,
  processing,
  success,
  error,
}

extension ViewStateExtension on ViewState {
  bool get isIdle => this == ViewState.idle;

  bool get isProcessing => this == ViewState.processing;

  bool get isSuccess => this == ViewState.success;

  bool get isError => this == ViewState.error;
}
