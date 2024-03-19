// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/models/validators/item_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String BriefValueKey = 'brief';
const String DescriptionValueKey = 'description';

final Map<String, TextEditingController> _CreateItemViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CreateItemViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateItemViewTextValidations = {
  BriefValueKey: ItemValidator.validateBrief,
  DescriptionValueKey: ItemValidator.validateDescription,
};

mixin $CreateItemView {
  TextEditingController get briefController =>
      _getFormTextEditingController(BriefValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);

  FocusNode get briefFocusNode => _getFormFocusNode(BriefValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateItemViewTextEditingControllers.containsKey(key)) {
      return _CreateItemViewTextEditingControllers[key]!;
    }

    _CreateItemViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateItemViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateItemViewFocusNodes.containsKey(key)) {
      return _CreateItemViewFocusNodes[key]!;
    }
    _CreateItemViewFocusNodes[key] = FocusNode();
    return _CreateItemViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    briefController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    briefController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          BriefValueKey: briefController.text,
          DescriptionValueKey: descriptionController.text,
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

    for (var controller in _CreateItemViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateItemViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateItemViewTextEditingControllers.clear();
    _CreateItemViewFocusNodes.clear();
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

  String? get briefValue => this.formValueMap[BriefValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;

  set briefValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BriefValueKey: value}),
    );

    if (_CreateItemViewTextEditingControllers.containsKey(BriefValueKey)) {
      _CreateItemViewTextEditingControllers[BriefValueKey]?.text = value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_CreateItemViewTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateItemViewTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasBrief =>
      this.formValueMap.containsKey(BriefValueKey) &&
      (briefValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);

  bool get hasBriefValidationMessage =>
      this.fieldsValidationMessages[BriefValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;

  String? get briefValidationMessage =>
      this.fieldsValidationMessages[BriefValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
}

extension Methods on FormStateHelper {
  setBriefValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BriefValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    briefValue = '';
    descriptionValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      BriefValueKey: getValidationMessage(BriefValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateItemViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateItemViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      BriefValueKey: getValidationMessage(BriefValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
    });
