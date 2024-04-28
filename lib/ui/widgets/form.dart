import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final Icon? prefix;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final String? helperText;
  final TextInputType? inputType;
  const FormWidget(
      {super.key,
      this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.prefix,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.hintText,
      this.helperText,
      this.inputType});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF302E48),
          borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
        controller: widget.controller,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        keyboardType: widget.inputType,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        key: widget.fieldKey,
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefix,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white.withOpacity(0),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: widget.isPasswordField == true
                  ? Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText
                          ? Colors.grey.shade700.withOpacity(.50)
                          : const Color(0xFF1246FF),
                    )
                  : const Text(''),
            )),
      ),
    );
  }
}
