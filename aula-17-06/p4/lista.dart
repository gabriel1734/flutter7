class Lista {
  List<String> _itens = [];

  Lista() {
    novo();
  }

  List<String> getItens() {
    return _itens;
  }

  String getElemento(int pos) {
    return _itens[pos];
  }

  void deletar(int pos) {
    if (pos >= 0 && pos < _itens.length) {
      _itens.removeAt(pos);
    }
  }

  void novo() {
    DateTime agora = DateTime.now();
    String tempo = '${agora.hour}:${agora.minute}:${agora.second}';
    _itens.add(tempo);
  }
}
