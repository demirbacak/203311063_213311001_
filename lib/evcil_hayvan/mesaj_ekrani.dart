import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../tasiyici_sayfalar/main.dart';

class MesajEkarni extends StatefulWidget {
  const MesajEkarni({Key? key}) : super(key: key);

  @override
  State<MesajEkarni> createState() => _MesajEkarniState();
}

class _MesajEkarniState extends State<MesajEkarni> with TickerProviderStateMixin{

  bool _isMessageEmpty = true;

 final List<Mesaj> _mesajlar = [];

  final _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text){
    _textController.clear();
    Mesaj yeniMesaj = Mesaj(
        text: text,
        animationController: AnimationController(
        duration:const Duration(milliseconds: 700),
        vsync: this,),
    );
    setState(() {
      _mesajlar.insert(0, yeniMesaj);
      _isMessageEmpty = true;
    });
    _focusNode.requestFocus();
    yeniMesaj.animationController.forward();
  }

  Widget _buildTextConposer(){
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                onChanged: (String text){
                  setState(() {
                    _isMessageEmpty = text.isEmpty;
                  });
                },
                controller: _textController,
                onSubmitted: _isMessageEmpty ? null : _handleSubmitted,
                focusNode: _focusNode,
                decoration: const InputDecoration.collapsed(hintText: "Gönder"),
              ),
            ),
             IconButton(
                 onPressed: _isMessageEmpty ? null : ()=>_handleSubmitted(_textController.text),
                 icon: const Icon(FontAwesomeIcons.paperPlane)),
          ],
        ),
    );
  }

  @override
  void dispose(){
    for(Mesaj mesaj in _mesajlar ) {
      mesaj.animationController.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
         children: [
          Flexible(child: ListView.builder(
              padding: const EdgeInsets.all(8),
              reverse: true,
              itemBuilder: (_, int index) => _mesajlar[index],
              itemCount: _mesajlar.length,),
              ),
           const Divider(height: 6.0,),
           Container(decoration: BoxDecoration(
             color: color1,
           ),child: _buildTextConposer(),
           ),
        ],
      ),
    );
  }
}


class Mesaj extends StatelessWidget {
 // const Mesaj({Key? key}) : super(key: key);

  const Mesaj({super.key,  required this.text, required this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve:Curves.easeOut ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(text),
      ),
    );
  }
}







/*class MesajSayfasi extends StatefulWidget {
  const MesajSayfasi({Key? key}) : super(key: key);

  @override
  State<MesajSayfasi> createState() => _MesajSayfasiState();
}

class _MesajSayfasiState extends State<MesajSayfasi> {
  String? get girilenMesaj => null;

  List<Widget> mesajlar = [];

  Widget _mesajKaydet(String girilenMesaj) {
    if(girilenMesaj != "") { return Container(
      child: Text(girilenMesaj),
    );}
    else {return Container(
      child: Text(""),
    );}
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400,
            width: 400,
            child: Padding(padding: EdgeInsets.all(20.0),
            child:
    ListView.builder(
              reverse: true,
              itemCount: mesajlar.length,
              padding: EdgeInsets.all(10.0),
              /*itemBuilder: (context, index){
                return GestureDetector(
                  onTap: null,
                  child: mesajlar[index],
                );
              },*/
              itemBuilder: (_, int index) => mesajlar[index],
            ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (girilenMesaj) {
                    _mesajKaydet(girilenMesaj);
                  },
                  decoration: const InputDecoration(
                      hintText: " İletişime geçmek için mesaj bırakın"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () => { mesajlar.add(_mesajKaydet(girilenMesaj!)) },
                        style: ElevatedButton.styleFrom(backgroundColor: color1),
                        child: Text(
                          "Gönder",
                          style: TextStyle(
                            color: color2,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}*/
