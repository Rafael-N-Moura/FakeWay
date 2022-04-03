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
        body: TabBarView(
          children: [
            StaticEnviarDadoPage(
              type: false,
            ),
            StaticEnviarDadoPage(
              type: true,
            ),
            DynamicEnviarDadoPage(),
          ],
        ),
      ),
    );
  }
}

class DynamicEnviarDadoPage extends StatelessWidget {
  const DynamicEnviarDadoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.4,
      builder: ((context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Material(
            elevation: 20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: ScrollIndicatorWidget(),
                ),
                const CustomTableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Latitude'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Longitude'),
                  ),
                ),
                const SendDataLabelWidget(),
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
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Latitude',
                            style: TextStyle(
                                color: WayColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Text(
                            '-16.750296',
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
                            'Data',
                            style: TextStyle(
                                color: WayColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Text(
                            '17/05/2021',
                            style: TextStyle(
                                fontFamily: 'Sansation',
                                color: WayColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Longitude',
                            style: TextStyle(
                                color: WayColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Text(
                            '-49.3423414',
                            style: TextStyle(
                                fontFamily: 'Sansation',
                                color: WayColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SendDataButtonWidget(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SendDataLabelWidget extends StatelessWidget {
  const SendDataLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Text(
          'Enviando os seguintes dados',
          style: TextStyle(color: WayColors.primaryColor, fontSize: 20),
        ),
      ),
    );
  }
}

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2020, 10, 10),
        lastDay: DateTime(2022, 10, 10),
      ),
    );
  }
}

class ScrollIndicatorWidget extends StatelessWidget {
  const ScrollIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.87,
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WayColors.primaryColor,
      ),
    );
  }
}

class StaticEnviarDadoPage extends StatelessWidget {
  const StaticEnviarDadoPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  // false -> Temperatura
  // true -> Umidade
  final bool type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.72,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(2020, 10, 10),
                  lastDay: DateTime(2022, 10, 10),
                ),
              ),
              ValuePickerWidget(
                type: type,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                          type ? 'Umidade' : 'Temperatura',
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
        const SendDataButtonWidget(),
      ],
    );
  }
}

class SendDataButtonWidget extends StatelessWidget {
  const SendDataButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Enviar Dados',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      height: 48,
      width: 208,
      decoration: BoxDecoration(
          color: WayColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
