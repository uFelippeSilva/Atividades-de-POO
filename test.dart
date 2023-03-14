void main() {

  var cafe = Produto(3.0, 'leite ', DateTime(2023, 12, 31));
  var pao = Produto(2.0, 'Pão', DateTime(2023, 12, 31));
  var leite = Produto(4.0, 'Leite', DateTime(2023, 12, 31));

  var item1 = Item(2, cafe);
  var item2 = Item(3, pao);
  var item3 = Item(1, leite);

  var items = [item1, item2, item3];

  var venda = Venda(DateTime.now(), items);

  print('Produtos:');
  print(' -> ${Produto.cafe.descricao}, R\$ ${Produto.cafe.preco}');
  print(' -> ${Produto.pao.descricao}, R\$ ${Produto.pao.preco}');
  print(' -> ${Produto.leite.descricao}, R\$ ${Produto.leite.preco}');

  print('\nItens:');
  print(' -> ${items[0].quantidade}x ${items[0].produto.descricao}, R\$ ${items[0].produto.preco} cada, R\$ ${items[0].total} total');
  print(' -> ${items[1].quantidade}x ${items[1].produto.descricao}, R\$ ${items[1].produto.preco} cada, R\$ ${items[1].total} total');
  print(' -> ${items[2].quantidade}x ${items[2].produto.descricao}, R\$ ${items[2].produto.preco} cada, R\$ ${items[2].total} total');

  print('\nVenda:');
  print(' -> Date: ${venda.date}');
  print(' -> Total Items: ${venda.items.length}');
  print(' -> Valor total da venda: R\$ ${venda.total.toStringAsFixed(2)}');

}

class Produto {

  double preco;
  String descricao;
  DateTime validade;

  Produto(this.preco, this.descricao, this.validade);

  static final Produto cafe = Produto(5.0, 'Café', DateTime(2024, 12, 31));
  static final Produto pao = Produto(3.0, 'Pão', DateTime(2024, 12, 31));
  static final Produto leite = Produto(4.0, 'Leite', DateTime(2024, 12, 31));

}

class Item {

  int quantidade;
  double total; 
  Produto produto;

  Item(this.quantidade, this.produto) : total = quantidade * produto.preco;

}

class Venda {

  DateTime date;
  List<Item> items;
  late double total; 

  Venda(this.date, this.items) {
    total = items.fold(0.0, (previousValue, item) => previousValue + item.total);
  }
}
