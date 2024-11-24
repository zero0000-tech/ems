import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String? label;
  final bool isPassword;
  final Widget suffix;
  const FormInput({
    super.key,
    this.label,
    this.isPassword = false,
    this.suffix = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              )
            : const SizedBox.shrink(),
        label != null ? const SizedBox(height: 5) : const SizedBox.shrink(),
        Container(
          height: 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              suffixIcon: suffix,
            ),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
