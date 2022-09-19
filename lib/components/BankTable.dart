import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const DataGridBanks(),
      ),
    );
  }
}

class DataGridBanks extends StatelessWidget {
  const DataGridBanks({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nome',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Agencia',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Conta',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),

      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),DataRow(
          cells: <DataCell>[
            DataCell(Text('Bradesco')),
            DataCell(Text('12345-7')),
            DataCell(Text('12345-7')),
          ],
        ),














      ],
    );
  }
}
