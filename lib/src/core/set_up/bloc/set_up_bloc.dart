import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/src/core/set_up/domain/use_case/save_initial_items_use_case.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/di/locator.dart';
import 'package:test_project/src/services/local_storage_service.dart';

part 'set_up_event.dart';
part 'set_up_state.dart';
part 'set_up_bloc.freezed.dart';

class SetUpBloc extends Bloc<SetUpEvent, SetUpState> {
  SetUpBloc({
    SaveInitialItemsUseCase? saveInitialItemsUseCase,
    LocalStorageService? localStorageService,
  })  : _localStorageService = localStorageService ?? locator(),
        _saveInitialItemsUseCase = saveInitialItemsUseCase ?? locator(),
        super(const _Initial()) {
    on<_Started>(_onStarted);
    add(const _Started());
  }

  final SaveInitialItemsUseCase _saveInitialItemsUseCase;
  final LocalStorageService _localStorageService;

  FutureOr<void> _onStarted(_Started event, Emitter<SetUpState> emit) async {
    const storageKey = 'initialItemsSet';
    final hasData = _localStorageService.getPreference(key: storageKey) != null;
    if (hasData) return;
    await _saveInitialItemsUseCase(NoParams()).then(
      (result) => result.fold(
        (error) => add(const _Started()),
        (_) {
          _localStorageService.savePreference(
            key: storageKey,
            data: json.encode(true),
          );
        },
      ),
    );
  }
}
