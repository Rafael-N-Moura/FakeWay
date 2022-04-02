import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/way_colors.dart';
import '../widgets/value_picker_widget.dart';

class EnviarDadoPage extends StatelessWidget {
  const EnviarDadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: Text(
            "Nome do Ativo",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
              indicatorWeight: 8,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    'Temperatura',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Umidade',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Coordenada',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                )
              ]),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2020, 10, 10),
                lastDay: DateTime(2022, 10, 10),
              ),
            ),
            const ValuePickerWidget(
              type: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Text(
                'Enviando os seguintes dados',
                style: TextStyle(color: WayColors.primaryColor, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sensor',
                        style: TextStyle(
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Text(
                        '7',
                        style: TextStyle(
                            fontFamily: 'Sansation',
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Data',
                        style: TextStyle(
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Text(
                        '10/20/2020',
                        style: TextStyle(
                            fontFamily: 'Sansation',
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Temperatura',
                        style: TextStyle(
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Text(
                        '+1.5 C',
                        style: TextStyle(
                            fontFamily: 'Sansation',
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
