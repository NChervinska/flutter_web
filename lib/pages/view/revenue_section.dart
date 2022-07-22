import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/app_sales.dart';
import '../../constant/app_screen_size.dart';
import '../../constant/app_strings.dart';
import '../../model/ordinal_sales.dart';

const today = 'Today\'s revenue';
const todatAmount = '23';
const last7days = 'Last 7 days';
const last7daysAmount = '150';
const last30days = 'Last 30 days';
const last30daysAmount = '1 570';
const last12Months = 'Last 12 months';
const last12MonthsAmount = '3 234';

class RevenueSection extends StatelessWidget {
  const RevenueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 28),
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
      child: (width > AppScreenSize.customScreenSize)
          ? Row(children: [
              Expanded(child: _buildDiagram()),
              Expanded(child: _buildDaysInfo()),
            ])
          : Column(children: [
              _buildDiagram(),
              _buildDaysInfo(),
            ]),
    );
  }

  Widget _buildDiagram() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          AppStrings.revenueChart,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.lightGrey,
          ),
        ),
        SizedBox(
          width: 600,
          height: 200,
          child: charts.BarChart([
            charts.Series<OrdinalSales, String>(
              id: '',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (OrdinalSales sales, _) => sales.year,
              measureFn: (OrdinalSales sales, _) => sales.sales,
              data: sales,
            )
          ], animate: false),
        ),
      ],
    );
  }

  Widget _buildDaysInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            _buildCard(today, todatAmount),
            _buildCard(last7days, last7daysAmount),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            _buildCard(last30days, last30daysAmount),
            _buildCard(last12Months, last12MonthsAmount),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(String title, String amount) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$title \n\n',
          style: const TextStyle(color: AppColor.lightGrey, fontSize: 16),
          children: [
            TextSpan(
              text: amount,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
