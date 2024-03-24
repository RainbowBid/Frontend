// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/models/validators/auction_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ValueValueKey = 'value';

final Map<String, TextEditingController> _CreateBidViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CreateBidViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateBidViewTextValidations = {
  ValueValueKey: AuctionValidator.validatePrice,
};

mixin $CreateBidView {
  TextEditingController get valueController =>
      _getFormTextEditingController(ValueValueKey);

  FocusNode get valueFocusNode => _getFormFocusNode(ValueValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateBidViewTextEditingControllers.containsKey(key)) {
      return _CreateBidViewTextEditingControllers[key]!;
    }

    _CreateBidViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateBidViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateBidViewFocusNodes.containsKey(key)) {
      return _CreateBidViewFocusNodes[key]!;
    }
    _CreateBidViewFocusNodes[key] = FocusNode();
    return _CreateBidViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    valueController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    valueController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ValueValueKey: valueController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateBidViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateBidViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateBidViewTextEditingControllers.clear();
    _CreateBidViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get valueValue => this.formValueMap[ValueValueKey] as String?;

  set valueValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ValueValueKey: value}),
    );

    if (_CreateBidViewTextEditingControllers.containsKey(ValueValueKey)) {
      _CreateBidViewTextEditingControllers[ValueValueKey]?.text = value ?? '';
    }
  }

  bool get hasValue =>
      this.formValueMap.containsKey(ValueValueKey) &&
      (valueValue?.isNotEmpty ?? false);

  bool get hasValueValidationMessage =>
      this.fieldsValidationMessages[ValueValueKey]?.isNotEmpty ?? false;

  String? get valueValidationMessage =>
      this.fieldsValidationMessages[ValueValueKey];
}

extension Methods on FormStateHelper {
  setValueValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ValueValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    valueValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ValueValueKey: getValidationMessage(ValueValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateBidViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateBidViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ValueValueKey: getValidationMessage(ValueValueKey),
    });
