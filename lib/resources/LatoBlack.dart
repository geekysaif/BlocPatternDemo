class Fonts{
   get appFontlatoblack=> "Lato-Black";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fontslatoblack = new Fonts();
