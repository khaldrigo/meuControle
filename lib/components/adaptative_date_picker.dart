import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhum data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}

// IMPLEMENTAÇÃO ABAIXO POR ALGUM MOTIVO ESTAVA ERRADA E EU SIMPLESMENTE NAO DESCOBRI
// PQ E REFIZ DO 0



// class AdaptativeDatePicker extends StatelessWidget {
//   final DateTime selectedDate;
//   final Function(DateTime) onDateChanged;

//   AdaptativeDatePicker({
//     this.selectedDate,
//     this.onDateChanged,
//   });

//   _showDatePicker(BuildContext context) {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1990),
//       lastDate: DateTime.now(),
//     ).then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }

//       onDateChanged(pickedDate);
//     });
//     @override
//     Widget build(BuildContext context) {
//       return Platform.isIOS
//           ? Container(
//               height: 180,
//               child: CupertinoDatePicker(
//                 mode: CupertinoDatePickerMode.date,
//                 maximumDate: DateTime.now(),
//                 minimumDate: DateTime(1990),
//                 initialDateTime: DateTime.now(),
//                 onDateTimeChanged: onDateChanged,
//               ),
//             )
//           : Container(
//               height: 70,
//               child: Row(
//                 children: [
//                   Text(
//                     selectedDate == null
//                         ? 'Nenhuma data selecionada!'
//                         : 'Data Selecionada ${DateFormat('dd/MM/y').format(selectedDate)}',
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       child: Text(
//                         'Selecionar Data',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 18,
//                         ),
//                       ),
//                       onPressed: () => _showDatePicker(context),
//                     ),
//                   )
//                 ],
//               ),
//             );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
