import 'package:archlelabsadmin/controllers/BlogController.dart';
import 'package:archlelabsadmin/responsive/layouts.dart';
import 'package:archlelabsadmin/screens/main/components/site_template.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/teamController.dart';

import '../../models/TeamModel.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/dailogs.dart';

import '../../utils/paginated_table.dart';
import '../../utils/text_feilds.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      body: buildWidget(context),
    );
  }

  Widget buildWidget(context) {
    return Expanded(
      child: GetBuilder<TeamController>(builder: (_controller) {
        return !_controller.isLoaded
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
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            _controller.clearTeam();
                            Get.toNamed(Routes.addTeam);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppTheme.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Create Team",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    ResponsiveLayout.isSmallScreen(context)
                                        ? 150
                                        : 300,
                                minWidth: 100),
                            child: TextFormField(
                              onChanged: (value) {
                                _controller.searchTeam(value);
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
                          // columnSpacing: 20,
                          // fixedCornerColor: Colors.white,

                          // renderEmptyRowsInTheEnd: false,

                          // dataTextStyle:
                          //     TextStyle(color: AppTheme.whiteColor),
                          // horizontalMargin: 12,
                          minWidth: 786,
                          // dividerThickness: 0,
                          // showFirstLastButtons: true,
                          // headingRowHeight: 40,

                          sortAscending: true,

                          // headingTextStyle: GoogleFonts.openSans(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w600,
                          //     color: AppTheme.whiteColor),

                          // empty: Center(child: Text("No Data")),

                          // sortArrowAlwaysVisible: true,
                          // onRowsPerPageChanged: (value) {},
                          // headingRowDecoration: BoxDecoration(
                          //   color: Colors.black87,
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(4),
                          //     topRight: Radius.circular(4),
                          //   ),
                          // ),
                          dataRowHeight: 56,

                          columns: [
                            DataColumn2(
                                label: Text('Action'),
                                size: ColumnSize.S,
                                fixedWidth: 80),
                            DataColumn2(
                                label: Text('Image'),
                                size: ColumnSize.S,
                                fixedWidth: 80),
                            DataColumn(
                              label: Text('Name'),
                            ),
                            DataColumn(
                              label: Text('Role'),
                            ),
                            DataColumn2(
                              label: Text('Experience'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Skills'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Linked In'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Description'),
                            ),
                          ],
                          rowsPerPage: 10,
                          source: MyDataSource(_controller.teamDataList),
                        )),
                  )
                ],
              );
      }),
    );
  }
}

class MyDataSource extends DataTableSource {
  final List<Data> data;

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
        DataCell(Row(
          children: [
            InkWell(
              onTap: () {
                TDialogs.defaultDialog(
                  context: Get.context!,
                  onConfirm: () {
                    Get.find<TeamController>().deleteTeam(row.id);
                  },
                );
              },
              child: Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                Get.find<TeamController>().editTeam(row);
              },
              child: Icon(
                Icons.edit,
                size: 16,
              ),
            )
          ],
        )),
        DataCell(
          CachedNetworkImage(
            imageUrl: row.profileUrl!,
            height: 60,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        DataCell(
          Text(
            row.name ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 100,
          ),
        ),
        DataCell(Text(row.role ?? '')),
        DataCell(SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              row.experience ?? '',
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
              row.skills ?? '',
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
              row.linkedin ?? '',
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
              row.description ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 100,
            ),
          ),
        )),
      ],
    );
  }
}
