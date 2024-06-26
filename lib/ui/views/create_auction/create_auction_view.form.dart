// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/models/validators/auction_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String StartingPriceValueKey = 'startingPrice';

final Map<String, TextEditingController>
    _CreateAuctionViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateAuctionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAuctionViewTextValidations = {
  StartingPriceValueKey: AuctionValidator.validatePrice,
};

mixin $CreateAuctionView {
  TextEditingController get startingPriceController =>
      _getFormTextEditingController(StartingPriceValueKey);

  FocusNode get startingPriceFocusNode =>
      _getFormFocusNode(StartingPriceValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateAuctionViewTextEditingControllers.containsKey(key)) {
      return _CreateAuctionViewTextEditingControllers[key]!;
    }

    _CreateAuctionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateAuctionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateAuctionViewFocusNodes.containsKey(key)) {
      return _CreateAuctionViewFocusNodes[key]!;
    }
    _CreateAuctionViewFocusNodes[key] = FocusNode();
    return _CreateAuctionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    startingPriceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    startingPriceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StartingPriceValueKey: startingPriceController.text,
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

    for (var controller in _CreateAuctionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateAuctionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateAuctionViewTextEditingControllers.clear();
    _CreateAuctionViewFocusNodes.clear();
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

  String? get startingPriceValue =>
      this.formValueMap[StartingPriceValueKey] as String?;

  set startingPriceValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StartingPriceValueKey: value}),
    );

    if (_CreateAuctionViewTextEditingControllers.containsKey(
        StartingPriceValueKey)) {
      _CreateAuctionViewTextEditingControllers[StartingPriceValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasStartingPrice =>
      this.formValueMap.containsKey(StartingPriceValueKey) &&
      (startingPriceValue?.isNotEmpty ?? false);

  bool get hasStartingPriceValidationMessage =>
      this.fieldsValidationMessages[StartingPriceValueKey]?.isNotEmpty ?? false;

  String? get startingPriceValidationMessage =>
      this.fieldsValidationMessages[StartingPriceValueKey];
}

extension Methods on FormStateHelper {
  setStartingPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartingPriceValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    startingPriceValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      StartingPriceValueKey: getValidationMessage(StartingPriceValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateAuctionViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateAuctionViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      StartingPriceValueKey: getValidationMessage(StartingPriceValueKey),
    });
