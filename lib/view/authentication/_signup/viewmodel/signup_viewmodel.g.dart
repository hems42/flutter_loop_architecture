// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingupViewModel on _SingupViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SingupViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLockOpenAtom =
      Atom(name: '_SingupViewModelBase.isLockOpen', context: context);

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  late final _$signupAsyncAction =
      AsyncAction('_SingupViewModelBase.signup', context: context);

  @override
  Future<SignupResponseModel> signup() {
    return _$signupAsyncAction.run(() => super.signup());
  }

  late final _$_SingupViewModelBaseActionController =
      ActionController(name: '_SingupViewModelBase', context: context);

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_SingupViewModelBaseActionController.startAction(
        name: '_SingupViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_SingupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_SingupViewModelBaseActionController.startAction(
        name: '_SingupViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_SingupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLockOpen: ${isLockOpen}
    ''';
  }
}
