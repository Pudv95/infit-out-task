const int numRows = 5;
const int numCols = 5;

final List<String> tableHeadings =
    List.generate((2 * numCols) + 2, (index) => "Col ${index + 1}");

final List<List<String>> rowHeadings = List.generate(
  numRows,
  (rowIndex) => List.generate(
    2 * numCols + 2,
    (colIndex) => rowIndex == 0
        ? tableHeadings[colIndex]
        : '(R$rowIndex, C${colIndex + 1})',
  ),
);
