import 'package:flutter/material.dart';

// TODO: implementar algum comportamento/animação quando uma busca de string vazia for solicitada
class SearchTextField extends StatefulWidget {
  final void Function(String) onSubmitted;
  final String? initialText;

  const SearchTextField({
    Key? key,
    required this.onSubmitted,
    this.initialText,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: TextField(
        controller: _controller,
        maxLines: 1,
        style: Theme.of(context).textTheme.headline5,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          hintText: "Ex. Pusheen Cat",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
          suffixIcon: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.search),
            onPressed: () {
              final query = _controller.text;

              widget.onSubmitted(query);
            },
          ),
        ),
      ),
    );
  }
}
