import 'package:flutter/material.dart';

extension MaterialStatePropertyX on MaterialStateProperty {
  static MaterialStateProperty<T> when<T>({
    required T normal,
    T? focused,
    T? hovered,
    T Function(T normal)? pressed,
    T Function(T normal)? disabled,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (focused != null && states.contains(MaterialState.focused)) {
        return focused;
      }

      if (hovered != null && states.contains(MaterialState.hovered)) {
        return hovered;
      }

      if (pressed != null && states.contains(MaterialState.pressed)) {
        return pressed(normal);
      }

      if (disabled != null && states.contains(MaterialState.disabled)) {
        return disabled(normal);
      }

      return normal;
    });
  }
}

extension SetMaterialStateX on Set<MaterialState> {
  bool get isDisabled => contains(MaterialState.disabled);
  bool get isPressed => contains(MaterialState.pressed);
  bool get isHovered => contains(MaterialState.hovered);
  bool get isFocused => contains(MaterialState.focused);
}
