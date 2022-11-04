import 'package:flutter/material.dart';
import 'package:fxv_ide/theme.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        toolbarTextStyle: const TextStyle(color: Color(0xff000000)),
        backgroundColor: const Color(0xffffffff),

        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            iconSize: 100,
            onPressed: () => Navigator.pushNamed(context, '/'),
            icon: SizedBox(
              width: 100,
              child: Image.asset(
                "assets/logo/fxvLogo.png",
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background/bgTerm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Welcome to", style: Theme.of(context).textTheme.headline3,)

              ),
              Text("Fluxiv", style: TextStyle(
                fontSize: 110,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                height: 0.9,
                ),
              ),
              SizedBox(
                width: 350.0,
                child: Text("We prepare this easy interactive resume about our terms and services to you know what Fluxiv expects from you and what you can expect from us."),
              ),
              Container(
                width: 350.0,
                padding: EdgeInsets.only(top: 12),
                child: Text("We don’t like the same boring “Blah, blah, blah” so we made it more enjoyable!  :)", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                width: 350,
                padding: EdgeInsets.symmetric(
                  vertical: 12
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF4F4F8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)
                  ),
                    onPressed: () => {},
                    child: Text("Know More", style: TextStyle(color: Color(FxvTheme.fxvColor), fontWeight: FontWeight.w900),)),
              ),
        TermForm(),
            ]
          ),
        ),
      ),
    );
  }

}
class TermForm extends StatefulWidget{
  const TermForm({Key? key}) : super(key: key);

  @override
  State<TermForm> createState() => TermFormState();
}
class TermFormState extends State<TermForm>{
  bool accepted= false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                value: accepted,
                activeColor: Color(FxvTheme.darkColor),
                onChanged: (bool? value){
              setState(() {
                accepted = value!;
              });
            }),
            Text("I accept the terms and conditions", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(FxvTheme.darkColor)
            ),)
          ],
        ),
        
        Container(
          width: 350,
          padding: EdgeInsets.symmetric(
              vertical: 12
          ),
          child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(FxvTheme.darkColor),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20)
              ),
              onPressed: accepted == true ? () => {} : null,
              child: Text("Go to Fluxiv!", style: TextStyle(color: Color(FxvTheme.fxvColor), fontWeight: FontWeight.w900),)),)


      ],
    );
  }

}
