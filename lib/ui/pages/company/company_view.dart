import 'package:app_report/domain/class/report.dart';
import 'package:app_report/providers/report_provider.dart';
import 'package:app_report/ui/pages/company/company_view_provider.dart';
import 'package:app_report/ui/resources/app_colors.dart';
import 'package:app_report/utils/methods/methods_reports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/container_group_check_box.dart';
import '../../widgets/graph_bar_canal.dart';
import '../../widgets/graph_bar_medio.dart';
import '../../widgets/graph_pie_platform.dart';
import '../../widgets/graph_pie_provenance_leads.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});
  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  
  void saveListOptionsCompany(List<String> listOption){
    final provider = Provider.of<CompanyViewProvider>(context,listen: false);
    provider.listNameCompanySelect = listOption; 
  }

  void saveListOptionsTypeCar(List<String> listOption){
    final provider = Provider.of<CompanyViewProvider>(context,listen: false);
    provider.listNameTypeCarSelect = listOption; 
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final listOptionCompany = Provider.of<CompanyViewProvider>(context).listNameCompany;
    final listOptionTypeCar = Provider.of<CompanyViewProvider>(context).listNameTypeCar;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: 
      Column(
        children: [
          Card(
            elevation: 5,
            child: ExpansionTile(
              iconColor: AppColors.contentColorGreen,
              title: const Text(
                'Empresa Filtrar Información',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,
                color: AppColors.contentColorWhite),
              ),
              backgroundColor: AppColors.secondary,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ContainerGroupCheckBox(
                      title: 'Empresa',
                      listOption: listOptionCompany,
                      handleSaveListOptions: saveListOptionsCompany,
                      width: mediaQuerySize.width * 0.49,
                      height: 170,
                    ),
                    ContainerGroupCheckBox(
                      title: 'Cat Vehículo',
                      listOption: listOptionTypeCar,
                      handleSaveListOptions: saveListOptionsTypeCar,
                      width: mediaQuerySize.width * 0.45,
                      height: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const ContainerGraphs()
        ],
      )
    );
  }
}

class ContainerGraphs extends StatelessWidget {
  const ContainerGraphs({super.key});
  @override
  Widget build(BuildContext context) {

    List<Report> listReport = Provider.of<ReportProvider>(context).listReport;
    List<String> listNameCompanySelect = Provider.of<CompanyViewProvider>(context).listNameCompanySelect;
    List<String> listNameTypeCarSelect  = Provider.of<CompanyViewProvider>(context).listNameTypeCarSelect;
    List<Report> listReportFilter = filterCompanyAndCatCar(listReport,listNameCompanySelect,listNameTypeCarSelect);
    
    return Column(
      children: [
        GraphPieProvenanceLeads(listReport: listReportFilter),
        const SizedBox(height: 10),
        GraphBarCanal(listReport: listReportFilter),
        const SizedBox(height: 10),
        GraphPiePlatform(listReport: listReportFilter),
        const SizedBox(height: 10),
        GraphBarMedio(listReport: listReportFilter),
        const SizedBox(height: 20),
      ],
    );
  }
}


