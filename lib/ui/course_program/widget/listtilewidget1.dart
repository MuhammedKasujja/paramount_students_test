import 'package:flutter/material.dart';

class ListTileWidget1 extends StatelessWidget {
  final String leading;
  final String trailing;
  const ListTileWidget1({
    super.key,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leading,
        style: const TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: SizedBox(
        width: 180,
        child: Text(
          trailing,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
