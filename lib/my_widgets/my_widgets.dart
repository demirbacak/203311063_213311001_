import 'package:flutter/material.dart';
import '../kategori_sayfalari/evcil_hayvan_model.dart';
import '../main.dart';

/*Widget buildNavigationIcons({required IconData myicon, required String mytext, required Widget mywidget, required BuildContext context,}){
  return Column(
    children: [
      IconButton(
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {return mywidget;}));},
        icon: FaIcon(myicon),),
      Text(mytext,
        style: TextStyle(
            color: color2,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),
      ),
    ],
  );
}*/

Widget buildEvcilHayvan({required EvcilHayvanModel yeniEvcilHayvan}){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 12, top: 20),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(
            color:Colors.black.withOpacity(0.6),
            blurRadius: 4,
          ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                )]
            ),
            height: 100.0,
            width: 150.0,
            child: Image(image:AssetImage(yeniEvcilHayvan.resim),
              fit: BoxFit.fill,
            ),
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(yeniEvcilHayvan.isim,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: color2,
                  ),
                ),
                Text(yeniEvcilHayvan.turu,
                  style: TextStyle(
                    color: color2,
                  ),),
                Text(yeniEvcilHayvan.yasi,
                  style: TextStyle(
                    color: color2,),),
                Text("Konum: ${yeniEvcilHayvan.konum}",
                  style: TextStyle(
                    color: color2,),),
                Text("Cinsiyet: ${yeniEvcilHayvan.cinsiyet}",
                  style: TextStyle(
                    color: color2,)
                  ,)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildKategori({required IconData myicon, required String kategoriAdi, required Widget mywidget, required BuildContext context,}){
  return GestureDetector(
    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){return mywidget;}));},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(
            color:Colors.black.withOpacity(0.3),
            blurRadius: 4,
          ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(myicon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(kategoriAdi,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: color2,

                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}