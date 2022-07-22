import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/app_strings.dart';

const name = 'Santos Enoque';
const city = 'New York City';

class AvailableDrivers extends StatelessWidget {
  const AvailableDrivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.lightGrey, width: 1),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 6),
            color: AppColor.lightGrey.withOpacity(.1),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.availableDrivers,
            style: TextStyle(
              color: AppColor.lightGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildDataTable(),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return SizedBox(
      height: 400,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        columns: const [
          DataColumn2(label: Text(AppStrings.name), size: ColumnSize.L),
          DataColumn(label: Text(AppStrings.location)),
          DataColumn(label: Text(AppStrings.rating)),
        ],
        rows: List<DataRow>.generate(
          7,
          (index) => DataRow(cells: [
            const DataCell(Text(name)),
            const DataCell(Text(city)),
            DataCell(Text(index.toString())),
          ]),
        ),
      ),
    );
  }
}
