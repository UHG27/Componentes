import 'dart:html';

import 'package:flutter/material.dart';


class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String _userName = '';
  String _password = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _inputFielDateController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de datos por el usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: [
          _crearEntradaNombre(),
          const Divider(),
          _crearEntradaPassword(),
          const Divider(),
          _crearMail(),
          const Divider(),
          _crearEntradaFecha(),
          const Divider(),
          _crearDropDown(),
        ],
      ),
    );
  }

  Widget _crearEntradaNombre() {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.red,
      // cursorRadius: const Radius.circular(10.0),
      // cursorWidth: 5.0,
      // maxLength: 5.0,
      // maxLines: null,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Escriba su nombre, porfavor",
          labelText: "Nombre: ",
          prefixIcon: const Icon(Icons.person),
          // prefix: const CircularProgressIndicator(),
          // icon: const Icon(Icons.person),
          iconColor: Colors.blueGrey),
      onChanged: (valor) {
        _userName = valor;
        print(_userName);
      },
    );
  }

  Widget _crearEntradaPassword() {
    return TextField(
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.red,
      cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0,
      maxLength: 8,
      obscureText: true,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Escriba su contraseña",
          labelText: "Password: ",
          suffixIcon: const Icon(Icons.key),
          // prefix: const CircularProgressIndicator(),
          // icon: const Icon(Icons.person),
          iconColor: Colors.blueGrey),
      onChanged: (valor) {
        _password = valor;
        print(_password);
      },
    );
  }

  Widget _crearMail() {
    return TextField(
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.red,
      cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Escriba Email",
          labelText: "E-mail: ",
          suffixIcon: const Icon(Icons.mail),
          // prefix: const CircularProgressIndicator(),
          // icon: const Icon(Icons.person),
          iconColor: Colors.blueGrey),
      onChanged: (valor) {
        _email = valor;
        print(_email);
      },
    );
  }

  Widget _crearEntradaFecha() {
    return TextField(
      controller: _inputFielDateController,
      enableInteractiveSelection: false,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.red,
      cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Escriba Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: const Icon(Icons.calendar_today),
          // prefix: const CircularProgressIndicator(),
          // icon: const Icon(Icons.person),
          iconColor: Colors.blueGrey),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        print(_fecha);
        _fecha = DateFormat('dd-MM-yyyy').format(picked);
        _inputFielDateController.text = _fecha;
      });
    }
  }
  Widget _crearDropDown(){
    return DropdownButton(
      items: const [], 
    onChanged: (opt){});
  }

  List<DropdownMenuItem<String>> getOptionsDropDown(){
    List<String> _lenguajes = ['Java', 'PHP', 'JavaScript', 'Dart'];
    List<DropdownMenuItem<String>> lista = List();
    _lenguajes.forEach((lenguaje) { 
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
        value: lenguaje,
        ));
    });
    return lista;
  }
}