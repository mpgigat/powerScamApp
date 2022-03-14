// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:scamhunters/models/scammer_model.dart';

class ListScammers extends StatelessWidget {
  final List<Scammer> scammers;

  const ListScammers(this.scammers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: scammers.length,
        itemBuilder: (BuildContext context, int index) {
          return _Scammer(scammer: scammers[index], index: index);
        });
  }
}

class _Scammer extends StatelessWidget {
  final Scammer scammer;
  final int index;

  const _Scammer({required this.scammer, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTitulo(
          scammer: scammer,
          index: index,
        ),
      ],
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Scammer scammer;
  final int index;
  const _TarjetaTitulo({required this.scammer, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. '),
          Text(scammer.name),
        ],
      ),
    );
  }
}
