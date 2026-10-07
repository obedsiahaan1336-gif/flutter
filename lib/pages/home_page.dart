import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_navigation_page.dart';
import 'package:flutter_application_1/pages/produk_list_page.dart';
import 'package:flutter_application_1/widget_basic/avatar1.dart';
import 'package:flutter_application_1/widget_basic/button1.dart';
import 'package:flutter_application_1/widget_basic/column1.dart';
import 'package:flutter_application_1/widget_basic/container1.dart';
import 'package:flutter_application_1/widget_basic/counter_widget.dart';
import 'package:flutter_application_1/widget_basic/dialog_widget.dart';
import 'package:flutter_application_1/widget_basic/expanded_widget.dart';
import 'package:flutter_application_1/widget_basic/form_widget.dart';
import 'package:flutter_application_1/widget_basic/gridview_widget.dart';
import 'package:flutter_application_1/widget_basic/icon1.dart';
import 'package:flutter_application_1/widget_basic/image1.dart';
import 'package:flutter_application_1/widget_basic/list_view_widget.dart';
import 'package:flutter_application_1/widget_basic/padding_widget.dart';
import 'package:flutter_application_1/widget_basic/product_card.dart';
import 'package:flutter_application_1/widget_basic/row1.dart';
import 'package:flutter_application_1/widget_basic/sizedbox_widget.dart';
import 'package:flutter_application_1/widget_basic/stack_widget.dart';
import 'package:flutter_application_1/widget_basic/text1.dart';
import 'package:flutter_application_1/widget_basic/textfield_widget.dart';
import 'package:flutter_application_1/widget_basic/wrap_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<_DemoItem> _demos = [
    _DemoItem(
      'Text',
      'Menampilkan teks dan gaya tulisan',
      Icons.text_fields,
      (_) => const Text1(),
    ),
    _DemoItem(
      'Container',
      'Warna, ukuran, dan sudut container',
      Icons.crop_square,
      (_) => const Container1(),
    ),
    _DemoItem(
      'Button',
      'Contoh tombol Add To Cart',
      Icons.smart_button,
      (_) => const Button1(),
    ),
    _DemoItem(
      'Avatar',
      'Menampilkan avatar pengguna',
      Icons.account_circle,
      (_) => const Avatar1(),
    ),
    _DemoItem(
      'Column',
      'Menyusun konten secara vertikal',
      Icons.view_column,
      (_) => const Column1(),
    ),
    _DemoItem(
      'Row',
      'Menyusun konten secara horizontal',
      Icons.view_stream,
      (_) => const Row1(),
    ),
    _DemoItem(
      'Icon',
      'Contoh penggunaan ikon',
      Icons.favorite,
      (_) => const Icon1(),
    ),
    _DemoItem(
      'Image',
      'Menampilkan gambar dari assets',
      Icons.image,
      (_) => const Image1(),
    ),
    _DemoItem(
      'Wrap',
      'Menyusun item ke beberapa baris',
      Icons.widgets,
      (_) => WrapWidget(),
    ),
    _DemoItem(
      'Counter',
      'Menambah dan mengurangi angka',
      Icons.exposure_plus_1,
      (_) => const CounterWidget(),
    ),
    _DemoItem(
      'Dialog',
      'Menampilkan dialog konfirmasi',
      Icons.chat_bubble_outline,
      (_) => const DialogWidget(),
    ),
    _DemoItem(
      'Expanded',
      'Mengatur ruang pada baris',
      Icons.open_in_full,
      (_) => const ExpandedWidget(),
    ),
    _DemoItem(
      'Form',
      'Validasi nama dan email',
      Icons.assignment,
      (_) => const FormWidget(),
    ),
    _DemoItem(
      'GridView',
      'Menampilkan item dalam bentuk grid',
      Icons.grid_view,
      (_) => const GridViewWidget(),
    ),
    _DemoItem(
      'ListView',
      'Contoh daftar kategori',
      Icons.view_list,
      (_) => ListViewWidget(),
    ),
    _DemoItem(
      'Padding',
      'Mengatur jarak di sekitar konten',
      Icons.space_bar,
      (_) => const PaddingWidget(),
    ),
    _DemoItem(
      'Product Card',
      'Contoh komponen kartu produk',
      Icons.credit_card,
      (_) => const _ProductCardDemo(),
    ),
    _DemoItem(
      'SizedBox',
      'Mengatur jarak dan ukuran',
      Icons.aspect_ratio,
      (_) => const SizedBoxWidget(),
    ),
    _DemoItem(
      'Stack',
      'Menumpuk ikon keranjang dan badge',
      Icons.layers,
      (_) => const StackWidget(),
    ),
    _DemoItem(
      'TextField',
      'Memasukkan teks dan melihat pratinjau',
      Icons.edit,
      (_) => const TextFieldWidget(),
    ),
    _DemoItem(
      'Daftar Produk',
      'Buka detail produk dan pilih produk',
      Icons.shopping_bag,
      (_) => ProdukListPage(),
    ),
    _DemoItem(
      'Main Navigation',
      'Contoh navigasi Beranda, Favorit, dan Profil',
      Icons.menu,
      (_) => const MainNavigationPage(),
    ),
  ];

  void _bukaDemo(BuildContext context, _DemoItem demo) {
    Navigator.push(context, MaterialPageRoute<void>(builder: demo.builder));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum Flutter')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Semua Contoh Widget',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Pilih contoh untuk melihat hasilnya dan mencoba interaksinya.',
          ),
          const SizedBox(height: 16),
          for (final demo in _demos)
            Card(
              child: ListTile(
                leading: Icon(demo.icon),
                title: Text(demo.title),
                subtitle: Text(demo.description),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _bukaDemo(context, demo),
              ),
            ),
        ],
      ),
    );
  }
}

class _DemoItem {
  const _DemoItem(this.title, this.description, this.icon, this.builder);

  final String title;
  final String description;
  final IconData icon;
  final WidgetBuilder builder;
}

class _ProductCardDemo extends StatelessWidget {
  const _ProductCardDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Card')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ProductCard(
          nama: 'Kursi Minimalis',
          harga: 350000,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Kursi Minimalis dipilih')),
            );
          },
        ),
      ),
    );
  }
}
