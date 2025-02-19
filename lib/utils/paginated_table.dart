import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

/// Custom PaginatedDataTable widget with additional features
class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = 56,
    this.sortAscending = true,
    this.minWidth = 1000,
  });

  /// Whether to sort the DataTable in ascending or descending order.
  final bool sortAscending;

  /// Index of the column to sort by.
  final int? sortColumnIndex;

  /// Number of rows to display per page.
  final int rowsPerPage;

  /// Data source for the DataTable.
  final DataTableSource source;

  /// List of columns for the DataTable.
  final List<DataColumn> columns;

  /// Callback function to handle page changes.
  final Function(int)? onPageChanged;

  /// Height of each data row in the DataTable.
  final double dataRowHeight;

  /// Height of the entire DataTable.
  final double tableHeight;

  /// Minimum Width of the entire DataTable.
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Set the dynamic height of the PaginatedDataTable
      height: tableHeight,
      child: Theme(
        data: ThemeData.dark().copyWith(
            cardColor: bgColor, // Background color of the dropdown
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.white), // Text color of dropdown items

              labelSmall: TextStyle(color: Colors.white),

              bodySmall: TextStyle(color: Colors.white),
              displaySmall: TextStyle(color: Colors.white),
              headlineLarge: TextStyle(color: Colors.white),
            ),
            dropdownMenuTheme: DropdownMenuThemeData(
              textStyle: TextStyle(color: Colors.white),
              menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            dataTableTheme: DataTableThemeData(
              headingTextStyle: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Header text color
              ),
            ),
            colorScheme: ColorScheme.dark(),
            popupMenuTheme: PopupMenuThemeData(
              color: Colors.white, // White background for dropdown menu

              textStyle: TextStyle(color: Colors.white), // Dropdown text color
            )),
        child: PaginatedDataTable2(
          source: source,
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          showFirstLastButtons: true,
          showCheckboxColumn: true,
          sortAscending: sortAscending,
          onPageChanged: onPageChanged,
          dataRowHeight: dataRowHeight,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},
          sortColumnIndex: sortColumnIndex,
          headingTextStyle: Theme.of(context).textTheme.titleMedium,

          empty: Center(child: Text("No Data")),
          headingRowDecoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          // sortArrowBuilder: (bool ascending, bool sorted) {
          //   if (sorted) {
          //     return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down, size: TSizes.iconSm);
          //   } else {
          //     return const Icon(Iconsax.arrow_3, size: TSizes.iconSm);
          //   }
          // },
        ),
      ),
    );
  }
}
