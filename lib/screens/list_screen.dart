import 'package:flutter/material.dart';
import 'package:flutter_scroll_api_test/components/friend_card.dart';
import 'package:flutter_scroll_api_test/components/loading.dart';
import 'package:flutter_scroll_api_test/components/message.dart';
import 'package:flutter_scroll_api_test/entity/friend.dart';
import 'package:flutter_scroll_api_test/services/friend_service.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _currentPage = 1;
  List<Friend> _list = [];
  bool _firstLoadRealized = false;
  bool _loadingMoreFriends = false;
  bool _showGoBackButton = false;
  bool _continueRequest = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadList().then((value) {
      _firstLoadRealized = true;
    });
  }

  Future<void> _loadList() async {
    print('load list');
    if (!_continueRequest) {
      return;
    }
    if (!_loadingMoreFriends) {
      setState(() {
        _loadingMoreFriends = true;
      });
    }
    List<Friend> atualList = await FriendService().findAll(_currentPage);
    if (atualList.isNotEmpty) {
      print("Adicionou: ${atualList.length} na lista.");
      setState(() {
        _list.addAll(atualList);
        _loadingMoreFriends = false;
      });
    } else {
      print("Não tem mais registro na API, para requisições.");

      if (_loadingMoreFriends) {
        setState(() {
          _continueRequest = false;
          _loadingMoreFriends = false;
          _showGoBackButton = true;
        });
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        print('Início do scroll: não faz nada.');
      } else {
        print('Chegou ao fim do scroll.');
        print('Página atual: $_currentPage ');
        if (_continueRequest) {
          _currentPage++;
          _loadList();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: _list.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Friend friend = _list[index];
                        return FriendCard(friend: friend);
                      }),
                ),
                _loadingMoreFriends
                    ? const Loading(big: false)
                    : Container(
                        height: 0,
                      ),
                _showGoBackButton
                    ? ElevatedButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            0.0, // posição para rolar
                            duration: const Duration(
                                seconds: 1), // duração da animação
                            curve: Curves.easeInOut, // curva da animação
                          );
                          setState(() {
                            _showGoBackButton = false;
                          });
                        },
                        child: Text('Voltar'),
                      )
                    : Container(
                        height: 0,
                      )
              ],
            )
          : _firstLoadRealized
              ? const Message(message: 'Nenhum amigo encontrado.')
              : const Loading(big: true),
    );
  }
}
