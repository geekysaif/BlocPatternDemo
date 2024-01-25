class Fonts{
   get appFontlatobold=> "Lato-Bold";

   static final Fonts _fonts = new Fonts._internal();
   factory Fonts() {
      return _fonts;
   }
   Fonts._internal();
}
Fonts fontslatobold = new Fonts();
