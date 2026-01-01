class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeLanLoading extends SettingsState {}

class ChangeLanSuccess extends SettingsState {
  final String lan;
  ChangeLanSuccess(this.lan);
}

class ChangeLanError extends SettingsState {
  final String errorMessage;
  ChangeLanError(this.errorMessage);
}

class GetLanLoading extends SettingsState {}

class GetLanSuccess extends SettingsState {
  final String lan;

  GetLanSuccess(this.lan);
}

class GetLanError extends SettingsState {
  final String errorMessage;

  GetLanError(this.errorMessage);
}
