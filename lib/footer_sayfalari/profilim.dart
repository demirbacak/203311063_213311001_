
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profilim extends ConsumerWidget {
  const Profilim({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: UserInformation(),
    );
  }
}

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

  Query kullaniciBilgisi = FirebaseFirestore.instance.collection('kullanicilar').where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email);

  //final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('kullanicilar').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: kullaniciBilgisi.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Text(data['email']),
              title: Text(data['isim']),
              subtitle: Text(data['soyisim']),
              trailing: Text(data['sehir']),
            );
          }).toList(),
        );
      },
    );
  }
}

/*class Profilim extends ConsumerWidget {
  const Profilim({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TextEditingController tisim = TextEditingController();
    TextEditingController tsoyisim = TextEditingController();
    TextEditingController temail = TextEditingController();
    TextEditingController tsifre = TextEditingController();
    TextEditingController tdogumtarihi = TextEditingController();
    TextEditingController tsehir = TextEditingController();

    Future<void> guncelle() async {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: temail.text, password: tsifre.text)
          .then((kullanici) {
        FirebaseFirestore.instance
            .collection("kullanicilar")
            .doc(temail.text)
            .update({
          "isim": tisim.text,
          "soyisim": tsoyisim.text,
          "email": temail.text,
          "sifre": tsifre.text,
          "dogumtarihi": tdogumtarihi.text,
          "sehir": tsehir.text
        }).whenComplete(() => showDialog(context: context, builder: (context)=>const AlertDialog(
          content: Text(
            "Bilgiler Güncellendi",
            style: (TextStyle(
              fontStyle: FontStyle.italic,
            )),
          ),
        ),));
      });
    }

    return Scaffold(

      body:
      ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "İsim : ",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: tisim,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Soyisim : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: tsoyisim,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("e-mail : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: temail,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Text("sifre : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: tsifre,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Doğum Tarihi : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: tdogumtarihi,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),
            const Text("Şehir : "),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: tsehir,
                decoration: const InputDecoration(),
                keyboardType: TextInputType.text,
              ),
            ),

          ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed:null,
                  style: ElevatedButton.styleFrom(backgroundColor: color1),
                  child: Text(
                    "Getir",
                    style: TextStyle(
                      color: color2,
                    ),
                  )),
              SizedBox(width: 5,),
              ElevatedButton(
                  onPressed:guncelle,
                  style: ElevatedButton.styleFrom(backgroundColor: color1),
                  child: Text(
                    "Güncelle",
                    style: TextStyle(
                      color: color2,
                    ),
                  )),
            ],
          ),
        ),

      ]),


      /*Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Text("Kullanıcı Adı: ${isim} ${soyisim}"),
          ],
        ),
      ),*/
    );
  }


}*/

/*class _ProfilimState extends State<Profilim> {
/* String isim = "";
 String soyisim = "";*/
  @override
  Widget build(BuildContext context) {
    /*List<dynamic> adSoyad = [];
  adSoyad = ModalRoute.of(context)?.settings.arguments as List;
  isim = adSoyad[1];
  soyisim = adSoyad[2];*/

    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20,
                color: color2,
                fontWeight: FontWeight.bold
            )
        ),
      ),*/
      body: const Text("Profil bilgileri burada bulunacak"),
      /*Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Text("Kullanıcı Adı: ${isim} ${soyisim}"),
          ],
        ),
      ),*/
      /*persistentFooterButtons: [
        buildNavigationIcons(myicon: FontAwesomeIcons.bars, mytext:"kategoriler" , mywidget: const Kategoriler(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.heart, mytext:"favorilerim" , mywidget: const Favorilerim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.house, mytext:"ana sayfa" , mywidget: const AnaSayfa(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.user, mytext:"profilim" , mywidget: const Profilim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.circleQuestion, mytext:"hakkında" , mywidget: const Hakkinda(), context: context),
      ],*/
    );
  }
}*/
