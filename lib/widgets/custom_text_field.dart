import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.label,
    required this.onChanged,
  });

  final String? label;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.keyboardType ==
              const TextInputType.numberWithOptions(decimal: true)
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(
                    r'^\d+\.?\d{0,2}$'), // Allow digits with an optional decimal point and up to 2 decimal places
              )
            ]
          : null,
      focusNode: _focusNode,
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue, // Change the border color here
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .disabledColor, // Set border color when not focused
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: '${widget.label}',
        labelStyle: TextStyle(
          color: _isFocused
              ? Theme.of(context).focusColor // Set label color when focused
              : Theme.of(context)
                  .disabledColor, // Set label color when not focused
        ),
      ),
    );
  }
}

class PasswordCustomTextField extends StatelessWidget {
  const PasswordCustomTextField({
    required this.onChanged,
    super.key,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the password';
        }
        //if the password is less than 6 characters show an error
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white),
      ),
      obscureText: true,
    );
  }
}
