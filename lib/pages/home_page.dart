import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget_basic/avatar1.dart';
import 'package:flutter_application_1/widget_basic/button1.dart';
import 'package:flutter_application_1/widget_basic/column1.dart';
import 'package:flutter_application_1/widget_basic/container1.dart';
import 'package:flutter_application_1/widget_basic/expanded_widget.dart';
import 'package:flutter_application_1/widget_basic/gridview_widget.dart';
import 'package:flutter_application_1/widget_basic/icon1.dart';
import 'package:flutter_application_1/widget_basic/image1.dart';
import 'package:flutter_application_1/widget_basic/list_view_widget.dart';
import 'package:flutter_application_1/widget_basic/padding_widget.dart';
import 'package:flutter_application_1/widget_basic/row1.dart';
import 'package:flutter_application_1/widget_basic/sizedbox_widget.dart';
import 'package:flutter_application_1/widget_basic/stack_widget.dart';
import 'package:flutter_application_1/widget_basic/text1.dart';
import 'package:flutter_application_1/widget_basic/wrap_widget.dart';
import 'package:flutter_application_1/widget_basic/dialog_widget.dart';
import 'package:flutter_application_1/widget_basic/counter_widget.dart';
import 'package:flutter_application_1/widget_basic/textfield_widget.dart';
import 'package:flutter_application_1/widget_basic/form_widget.dart';
import 'package:flutter_application_1/widget_basic/product_card.dart';



class _MenuItem {
  final String title;
  final IconData icon;
  final WidgetBuilder page;

  const _MenuItem(this.title, this.icon, this.page);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_MenuItem> menus = [
    _MenuItem('Container', Icons.crop_square, (context) => const Container1()),
    _MenuItem('Text', Icons.text_fields, (context) => const Text1()),
    _MenuItem('Button', Icons.smart_button, (context) => const Button1()),
    _MenuItem('Icon', Icons.star, (context) => const Icon1()),
    _MenuItem('Image', Icons.image, (context) => const Image1()),
    _MenuItem(
      'CircleAvatar',
      Icons.account_circle,
      (context) => const Avatar1(),
    ),
    _MenuItem('Column', Icons.view_agenda, (context) => const Column1()),
    _MenuItem('Row', Icons.view_column, (context) => const Row1()),
    _MenuItem('ListView', Icons.list, (context) => ListViewWidget()),
    _MenuItem('GridView', Icons.grid_view, (context) => const GridViewWidget()),
    _MenuItem('Stack', Icons.layers, (context) => const StackWidget()),
    _MenuItem('Padding', Icons.padding, (context) => const PaddingWidget()),
    _MenuItem(
      'Expanded',
      Icons.open_in_full,
      (context) => const ExpandedWidget(),
    ),
    _MenuItem(
      'SizedBox',
      Icons.check_box_outline_blank,
      (context) => const SizedBoxWidget(),
    ),
    _MenuItem('Wrap', Icons.wrap_text, (context) => WrapWidget()),
    // ===== Menu baru W4S3 =====
    _MenuItem(
      'Counter',
      Icons.add_circle,
      (context) => const CounterWidget(),
    ),
    _MenuItem(
      'TextField',
      Icons.keyboard,
      (context) => const TextFieldWidget(),
    ),
    _MenuItem('Form', Icons.assignment, (context) => const FormWidget()),
    _MenuItem('Dialog', Icons.chat_bubble, (context) => const DialogWidget()),
    _MenuItem(
      'ProductCard',
      Icons.shopping_bag,
      (context) => Scaffold(
        appBar: AppBar(title: const Text('ProductCard')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductCard(
            nama: 'Kursi Minimalis',
            harga: 350000,
            onTap: () {
              print('Kursi Minimalis ditekan');
            },
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAM Minggu 4')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final item = menus[index];
          return Card(
            child: ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: item.page));
              },
            ),
          );
        },
      ),
    );
  }
}