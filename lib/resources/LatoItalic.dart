class Fonts{
   get appFontlatoitalic=> "Lato-Italic";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fontslatoitalic = new Fonts();
