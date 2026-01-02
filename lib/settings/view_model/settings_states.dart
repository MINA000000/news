class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeLanLoading extends SettingsState {}

class LanSuccess extends SettingsState {
  final String lan;
  LanSuccess(this.lan);
}

class ChangeLanSuccess extends LanSuccess {
  ChangeLanSuccess(super.lan);
}

class ChangeLanError extends SettingsState {
  final String errorMessage;
  ChangeLanError(this.errorMessage);
}

class GetLanLoading extends SettingsState {}

class GetLanSuccess extends LanSuccess {
  GetLanSuccess(super.lan);
}

class GetLanError extends SettingsState {
  final String errorMessage;

  GetLanError(this.errorMessage);
}
