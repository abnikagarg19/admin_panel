import 'package:archlelabsadmin/models/InvestorsModel.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../controllers/HomeController.dart';
import '../../../responsive/layouts.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/paginated_table.dart';

Widget buildInvestors(context) {
  return Expanded(
    child: GetBuilder<HomeController>(builder: (_controller) {
      return !_controller.isLoadedInvestors
          ? Center(
              child: CircularProgressIndicator(
              color: AppTheme.primaryColor,
            ))
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding), //   co
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Investors",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 16),
                      ),
                      Container(
                          constraints: BoxConstraints(
                              maxWidth: ResponsiveLayout.isSmallScreen(context)
                                  ? 200
                                  : 300,
                              minWidth: 100),
                          child: TextFormField(
                            onChanged: (value) {
                              _controller.searchJobApply(value);
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                color: Colors.white54,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(240, 247, 253, 1),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(240, 247, 253, 1),
                                    width: 1,
                                  )),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: Colors.white54,
                                  ),
                              isDense: true,
                              //  filled: true,
                              //  fillColor: fillcolor,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              prefixIconColor: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,
                              suffixIconColor: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,

                              hintText: "Search",
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(
                          defaultPadding), //   constraints: BoxConstraints(maxWidth: 600),
                      child: TPaginatedDataTable(
                        minWidth: 786,
                        sortAscending: true,
                        dataRowHeight: 56,
                        columns: [
                          DataColumn2(
                            label: Text('Name'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('Phone'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('Email'),
                            size: ColumnSize.L,
                          ),
                          DataColumn2(
                            label: Text('Company'),
                            size: ColumnSize.L,
                          ),
                          DataColumn2(
                            label: Text('Company Type'),
                            size: ColumnSize.L,
                          ),
                          DataColumn2(label: Text('Resume'), fixedWidth: 40),
                        ],
                        rowsPerPage: 10,
                        source: MyDataSource(_controller.investorDataList),
                      )),
                )
              ],
            );
    }),
  );
}

class MyDataSource extends DataTableSource {
  final List<InvestorsModelData> data;

  MyDataSource(this.data);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) return null;

    final row = data[index];

    return DataRow2(
      cells: <DataCell>[
        DataCell(
          Text(
            row.firstname! + row.lastname! ?? '',
          ),
        ),
        DataCell(
          Text(
            row.phonenumber ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 100,
          ),
        ),
        DataCell(Text(row.emailid ?? '')),
        DataCell(SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              row.companyname ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 100,
            ),
          ),
        )),
        DataCell(SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              row.typeofinvestor ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 100,
            ),
          ),
        )),
        DataCell(InkWell(
          onTap: () async {
            // if (kIsWeb) {
            //   html.window.open(row.fileUrl!, '_blank'); // Web: Open in new tab
            // } else {
            //   OpenFile.open(row.fileUrl); // Mobile/Desktop: Open normally
            // }
            final Uri uri = Uri.parse(
              row.fileUrl!,
            );
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
            // OpenFile.open(row.fileUrl);
          },
          child: SvgPicture.asset(
            "assets/icons/doc_file.svg",
            height: 20,
          ),
        )),
      ],
    );
  }
}
