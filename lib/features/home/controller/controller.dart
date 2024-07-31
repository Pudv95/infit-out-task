import 'package:flutter/material.dart';
import 'package:scrollplus/features/home/utils/consts.dart';

/// The controller class for managing the home screen.
class Controller {
  /// Returns the color for a cell based on its row and column index.
  ///
  /// The [rowIndex] parameter specifies the index of the row.
  /// The [colIndex] parameter specifies the index of the column.
  /// Returns [Colors.grey] if the [rowIndex] is 0.
  /// Returns [Colors.blue] if both the [rowIndex] and [colIndex] are even or odd.
  /// Returns [Colors.green] otherwise.
  ///
  static Color getCellColor(int rowIndex, int colIndex, {bool alter = false}) {
    if (rowIndex == 0) {
      return Colors.grey;
    }
    final isEvenRow = rowIndex % 2 == 0;
    final isEvenCol = colIndex % 2 == 0;
    return (isEvenRow && isEvenCol) || (!isEvenRow && !isEvenCol)
        ? alter
            ? Colors.blue
            : Colors.indigoAccent
        : alter
            ? Colors.green
            : Colors.purple;
  }

  /// Returns a custom table cell widget.
  ///
  /// The [color] parameter specifies the background color of the cell.
  /// The [text] parameter specifies the text to be displayed in the cell.
  static Widget customTableCell(Color color, String text) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(child: Text(text)));
  }

  /// Adds data to the rowHeadings list.
  ///
  /// Generates a new row of data and appends it to the rowHeadings list.
  static void addData() {
    final rowIndex = rowHeadings.length;
    rowHeadings.add(
      List.generate(
        2 * numCols + 2,
        (colIndex) => '(R${rowIndex + 1}, C${colIndex + 1})',
      ),
    );
  }

  /// Removes the last row of data from the rowHeadings list.
  ///
  /// Removes the last row of data from the rowHeadings list if it contains more than one row.
  static void removeData() {
    if (rowHeadings.length > 1) {
      rowHeadings.removeLast();
    }
  }
}
