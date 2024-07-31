/// A custom scrollable table widget.
///
/// This widget displays a scrollable table with three sections: a fixed column in the middle,
/// a scrollable left column, and a reverse scrollable column on the right.
/// The table is populated with data from the [rowHeadings] list.
/// The number of columns in the table is determined by [numCols].
/// The table cells are styled using the [Controller.customTableCell] method.
///
/// The table supports adding and removing rows using the provided buttons.

import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:scrollplus/features/home/controller/controller.dart';
import 'package:scrollplus/features/home/utils/consts.dart';

class CustomScrollableTable extends StatefulWidget {
  const CustomScrollableTable({super.key});

  @override
  State<CustomScrollableTable> createState() => _CustomScrollableTableState();
}

class _CustomScrollableTableState extends State<CustomScrollableTable> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;

  @override
  void initState() {
    _controllers = LinkedScrollControllerGroup();
    _scrollController1 = _controllers.addAndGet();
    _scrollController2 = _controllers.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController1,
                      child: Table(
                        border: TableBorder.all(),
                        defaultColumnWidth: const FixedColumnWidth(67.0),
                        children: List.generate(
                          rowHeadings.length,
                          (rowIndex) => TableRow(
                            children: List.generate(
                              rowHeadings[rowIndex].length - 2 - numCols,
                              (colIndex) {
                                return Controller.customTableCell(
                                  Controller.getCellColor(rowIndex, colIndex,
                                      alter: true),
                                  rowHeadings[rowIndex][colIndex],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Table(
                      border: TableBorder.all(),
                      defaultColumnWidth: const FixedColumnWidth(50.0),
                      children: List.generate(
                        rowHeadings.length,
                        (rowIndex) => TableRow(
                          children: List.generate(2, (colIndex) {
                            return Controller.customTableCell(
                                Controller.getCellColor(rowIndex, colIndex),
                                rowHeadings[rowIndex][colIndex + numCols]);
                          }),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController2,
                      child: Table(
                        border: TableBorder.all(),
                        defaultColumnWidth: const FixedColumnWidth(67.0),
                        children: List.generate(
                          rowHeadings.length,
                          (rowIndex) => TableRow(
                            children: List.generate(
                              rowHeadings[rowIndex].length - 2 - numCols,
                              (colIndex) {
                                return Controller.customTableCell(
                                    Controller.getCellColor(rowIndex, colIndex,
                                        alter: true),
                                    rowHeadings[rowIndex]
                                        [colIndex + 2 + numCols]);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Controller.addData();
                  setState(() {});
                },
                child: const Text('Add Row')),
            ElevatedButton(
                onPressed: () {
                  Controller.removeData();
                  setState(() {});
                },
                child: const Text('Remove Row')),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
