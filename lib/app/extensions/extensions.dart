import 'package:flutter/material.dart';

extension ExtensionChecker on String {
  // is Svg
  bool get isSvg => this.endsWith('.svg');
  bool get isPng => this.endsWith('.png');
}

extension CommonWidgetUses on Widget {
  Widget paddingAll(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) => Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget paddingFromLTRB(double left, double top, double right, double bottom) => Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Widget paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) => Padding(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget marginAll(double val) => Container(
        margin: EdgeInsets.all(val),
        child: this,
      );

  Widget marginSymmetric({double vertical = 0, double horizontal = 0}) => Container(
        margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget marginFromLTRB(double left, double top, double right, double bottom) => Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Widget marginOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) => Container(
        margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget align(AlignmentGeometry alignment) => Align(
        alignment: alignment,
        child: this,
      );

  Widget center() => Center(
        child: this,
      );

  Widget expanded() => Expanded(
        child: this,
      );
}

extension CommonDoubleUseCase on double {
  // percentage Value(val) of the source(this)
  double percent(double val) => (this * val) / 100;
}

extension CommonNumUseCase on num {
  // percentage Value(val) of the source(this)
  double percent(double val) => (this * val) / 100;

  // spacer
  Widget get hSpacer => SizedBox(
        width: toDouble(),
      );

  Widget get vSpacer => SizedBox(
        height: toDouble(),
      );
}
