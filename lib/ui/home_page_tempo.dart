import 'package:componentes/providers/menu_provider.dart';
import 'package:componentes/ui/screens/alert.dart';
import 'package:componentes/utils/icons_mapping.dart';
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de componentes'),
      ),
      body: _lista(),
    );
  }
}

Widget _lista() {
  /*recuperacion de dtaos de un archivo json
  //print(menuProvider.opciones);
  menuProvider.loadData().then((opciones){
    print('_lista: ');
    print (opciones);
  });
  return ListView(
        children: _listaItems(),
      );*/
  return FutureBuilder(
    future: menuProvider.loadData(), // Indicando lo que queremos esperar
    initialData: const [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> sanpshot) {
      //print('buldier: ');
      //print(sanpshot.data);
      return ListView(
        children: _listaItems(sanpshot.data as List<dynamic>, context),
      );
    },
  );
}

List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
  final List<Widget> opciones = [];
  IconMapping iconMap = const IconMapping();

  data.forEach((opt) {
    final title = ListTile(
      title: Text(opt['texto']),
      leading: iconMap.getIcon(opt['icon']),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blue,
      ),
      subtitle: Text(opt['texto2']),
      onTap: () {
        Navigator.pushNamed(context, opt['ruta']);
        // Navigator.push(context, route);
      },
    );
    opciones
      ..add(title)
      ..add(const Divider());
  });
  return opciones;
  // return const [
  //         ListTile(
  //           title: Text('zkjcksjdc'),
  //           subtitle: Text('akjdcckjsfvkjd'),
  //         ),
  //         Divider(
  //           thickness: 3.0,
  //           color: Color.fromARGB(17, 82, 96, 0),
  //         ),
  //         ListTile(
  //           title: Text('woefhwifhswehfiwoifho4'),
  //           subtitle: Text('wlkenefwnfoefoeihfierfoei'),
  //         ),
  //         Divider(
  //           thickness: 1.5,
  //           color: Color.fromARGB(234, 221, 205, 0),
  //         ),
  //         ListTile(
  //           title: Text('wwodsijbsijbciebvieu'),
  //           subtitle: Text('sksdjbjsbvksbvjdhbeirfbj'),
  //         ),
  // //       ];
}
