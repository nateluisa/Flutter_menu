
import 'package:flutter/material.dart';
import 'package:flutter_project2/pages/banks.dart';
import 'package:flutter_project2/pages/banksNew.dart';


class BankInherited extends InheritedWidget { // é um widget de herança, que é responsável por manter informações e as passar para quem precisar.
  BankInherited({
    Key? key,
    required Widget child, // parametro obrigatorio
  }) : super(key: key, child: child);

  final List<BanksNewScreen> BanksList = [BanksNewScreen('Bradesco', 16548, 15823,)];
  void newBanks (String bank, int agency, int account) {
    BanksList.add(BanksNewScreen(bank, agency, account, banksContext: null,));
  }

  static BankInherited of(BuildContext context) { // Aqui é onde você encontra esse método, que pede um contexto e retorna esse objeto
    final BankInherited? result = context.dependOnInheritedWidgetOfExactType<BankInherited>();
    assert(result != null, 'No BanksInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BankInherited old) { // responsavel por monitorar os dados // BanksInherited old faz um comparativo do estado anterior e do posterior da informaçao adicionada a list
    return old.BanksList.length != BanksList.length ; // comparaçao bool que retornando true pra diferença de valor comunica os widgets que estao tentando passar dados
  } //
}

// BanksInherited precisa estar superior, na árvore de widgets, em relação a todo mundo.

// context é a alteração de valor de acordo com o local e nao o estado da variavel em si sendo alterado